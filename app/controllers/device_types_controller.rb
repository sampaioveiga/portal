class DeviceTypesController < ApplicationController
	before_action :check_authorization
	before_action :new_device_type, only: [ :index, :new ]
	before_action :load_device_type, only: [ :edit, :update ]
	after_action :verify_authorized, only: [ :index, :create, :edit, :update ]

	def index
		@device_types = DeviceType.order(:nome_dispositivo)
	end

	def new
	end

	def create
		@device_type = DeviceType.new(device_type_params)

		if @device_type.save
			flash[:success] = "Tipo de dispositivo adicionado"
			redirect_to device_types_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @device_type.update(device_type_params)
			flash[:success] = 'Tipo de dispositivo atualizado'
			redirect_to device_types_path
		else
			render :edit
		end
	end

	private

	def device_type_params
		params.require(:device_type).permit(
			:nome_dispositivo
		)
	end

	def new_device_type
		@device_type = DeviceType.new
	end

	def load_device_type
		@device_type = DeviceType.find(params[:id])
	end

	def check_authorization
		authorize DeviceType
	end
end