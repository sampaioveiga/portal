class TranspUserTripsController < ApplicationController
	before_action :authorize
	before_action :is_supervisor, only: [ :list ]
	before_action :set_trip, only: [ :show, :edit, :update ]
	before_action :load_selects, only: [ :new, :create, :edit, :update ]


	def index
		if current_user.administrator || current_user.transp_user.nivel_acesso == 2
			@trips = TranspUserTrip.all
		else
			@trips = current_user.transp_user_trips
		end
	end

	def list
		@q = TranspUserTrip.data_inicio_after_today.order(:data_inicio).ransack(params[:q])
		@trips = @q.result(distinct: true)
	end

	def show
	end

	def new
		@trip = TranspUserTrip.new
		@trip.user_id = current_user.id
		@trip.numero_passageiros = 1
		@trip.local_inicio_id = current_user.ulsne_site.id
		@trip.local_fim_id = current_user.ulsne_site.id
		@trip.data_inicio = Time.now + 1.day
		@trip.data_fim = @trip.data_inicio + 8.hour
		@trip.condutor = current_user.nome_utilizador
		if ( current_user.administrator || current_user.transp_user.nivel_acesso == 2 )
			@trip.supervisor = true
		else
			@trip.supervisor = false
		end
	end

	def create
		@trip = TranspUserTrip.new(transp_user_trip_params)
		@trip.supervisor = true if (current_user.administrator || current_user.transp_user.nivel_acesso == 2)
		@trip.aprovacao = 0
		@trip.user_id = current_user.id unless (current_user.administrator || current_user.transp_user.nivel_acesso == 2)

		if @trip.save
			flash[:success] = "Pedido de transporte individual efetuado"
			redirect_to transp_user_trips_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		@trip.supervisor = true if (current_user.administrator || current_user.transp_user.nivel_acesso == 2)
		if ((@trip.aprovacao != 0 || @trip.data_inicio < Date.today) && current_user.transp_user.nivel_acesso != 2)
			flash[:danger] = "Requisição não pode ser alterada"
			redirect_to @trip
		else
			if @trip.update(transp_user_trip_params)
				flash[:success] = "Requisição atualizada"
				redirect_to transp_user_trips_list_path()
			else
				render :edit
			end
		end
	end

	private

	def set_trip
		@trip = TranspUserTrip.find(params[:id])
		unless (current_user.administrator || current_user.transp_user.nivel_acesso == 2 || @trip.user == current_user)
			@transport = nil
			redirect_to transp_user_trips_path()
		end
	end

	def load_selects
		@users = User.joins(:transp_user).reorder(:nome_utilizador)
		if (current_user.administrator || current_user.transp_user.nivel_acesso == 2)
			@departments = UlsneDepartment.order(:nome_servico)
		else
			@departments = current_user.ulsne_departments
		end
		@destinations = TranspDestination.order(:destino)
		@sites = UlsneSite.order(:nome_unidade)
	end

	def transp_user_trip_params
		params.require(:transp_user_trip).permit(
			:user_id,
			:ulsne_department_id,
			:assunto,
			:numero_passageiros,
			:transp_destination_id,
			:data_inicio,
			:local_inicio_id,
			:data_fim,
			:local_fim_id,
			:condutor,
			:observacoes,
			:supervisor,
			:aprovacao,
			:comentarios_supervisor
		)
	end

	def is_supervisor
		redirect_to transp_user_trips_path() unless ( current_user.administrator || current_user.transp_user.nivel_acesso == 2 )
	end
end