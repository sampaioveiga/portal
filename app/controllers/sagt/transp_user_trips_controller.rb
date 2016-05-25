class Sagt::TranspUserTripsController < ApplicationController
	before_action :check_authorization, except: [ :show ]
	before_action :set_trip, only: [ :show, :edit, :update, :destroy ]
	before_action :load_selects, only: [ :new, :create, :edit, :update ]
	after_action :verify_authorized, except: [ :show ]

	def index
		if current_user.transp_user.nivel_acesso == 2
			@q = TranspUserTrip.data_inicio_after_today.order(:data_inicio).ransack(params[:q])
			@trips = @q.result(distinct: true)
		else
			redirect_to sagt_transp_user_trips_calendar_path
			#@q = current_user.transp_user_trips.data_inicio_after_today.order(:data_inicio).ransack(params[:q])
			#@trips = @q.result(distinct: true)
		end
	end

	def calendar
		if current_user.transp_user.nivel_acesso == 2
			@trips = TranspUserTrip.all
		else
			@trips = current_user.transp_user_trips
		end
	end

	def show
	end

	def new
		@trip = TranspUserTrip.new
		@trip.user_id = current_user.id
		@trip.numero_passageiros = 1
		@trip.local_inicio_id = current_user.ulsne_site.id
		@trip.local_fim_id = current_user.ulsne_site.id
		@trip.data_inicio = Time.now.beginning_of_hour + 1.day
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
			UserMailer.transp_user_trip_email(@trip).deliver_now
			redirect_to sagt_transp_user_trips_calendar_path()
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
				UserMailer.transp_user_trip_email(@trip).deliver_now
				redirect_to sagt_transp_user_trips_path()
			else
				render :edit
			end
		end
	end

	def destroy
		@trip.destroy
		redirect_to sagr_transp_user_trips_path()
	end

	private

	def set_trip
		@trip = TranspUserTrip.find(params[:id])
		unless (current_user.transp_user.nivel_acesso == 2 || @trip.user == current_user)
			@trip = nil
			redirect_to sagt_transp_user_trips_path()
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

	def check_authorization
		authorize TranspMaterial
	end
end