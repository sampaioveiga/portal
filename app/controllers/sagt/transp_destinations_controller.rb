class Sagt::TranspDestinationsController < ApplicationController
	before_action :check_authorization
	before_action :set_destination, only: [ :edit, :update ]
	after_action :verify_authorized, only: [ :index, :create, :edit, :update ]

	def index
		@destinations = TranspDestination.order(:destino)
		@destination = TranspDestination.new
	end

	def create
		@destination = TranspDestination.new(destination_params)

		if @destination.save
			flash[:success] = "Novo destino adicionado"
			redirect_to sagt_transp_destinations_url()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @destination.update(destination_params)
			flash[:success] = "Destino atualizado"
			redirect_to sagt_transp_destinations_url()
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

	def check_authorization
		authorize TranspDestination
	end
end