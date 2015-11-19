class TranspUserTripsController < ApplicationController
	# validate user, access, supervisor
	#before_action :set_trip, only: [ :show, :edit, :update ]


	def index
		@trips = TranspUserTrip.all
	end

	def show
		@trip = TranspUserTrip.first
	end

	def new
		@trip = TranspUserTrip.new
	end

	def create
		@trip = TranspUserTrip.new(transp_user_trip_params)

		if @trip.save
			flash[:success] = "Pedido de transporte individual efetuado"
			redirect_to transp_user_trips_path()
		else
			render :new
		end
	end

	private

	def set_trip
		@trip = TranspUserTrip.find(params[:id])
	end

	def transp_user_trip_params
		params.require(:transp_user_trip).permit(:user_id,
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
												:comentarios_supervisor)
	end
end