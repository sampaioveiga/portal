class TranspDestinationsController < ApplicationController
	before_action :authorize
	before_action :is_admin
	before_action :set_destination, only: [ :edit, :update ]

	def index
		@destinations = TranspDestination.order(:destino)
		@destination = TranspDestination.new
	end

	def create
		@destination = TranspDestination.new(destination_params)

		if @destination.save
			flash[:success] = "Novo destino adicionado"
			redirect_to transp_destinations_url()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @destination.update(destination_params)
			flash[:success] = "Destino atualizado"
			redirect_to transp_destinations_url()
		else
			render :edit
		end
	end

	private

	def set_destination
		@destination = TranspDestination.find(params[:id])
	end

	def destination_params
		params.require(:transp_destination).permit(:destino)
	end

	def is_admin
		redirect_to transp_user_trips_path() unless (current_user.administrator || current_user.transp_user.nivel_acesso == 2)
	end
end