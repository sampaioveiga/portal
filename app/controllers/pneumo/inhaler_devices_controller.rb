class Pneumo::InhalerDevicesController < ApplicationController
  before_action :authenticate_user!
	#before_action
    before_action :load_devices_and_categories, only: [ :index, :create, :edit, :update ]
    before_action :set_device, only: [ :edit, :update ]
	#after_validation

	def index
        @inhaler_device = PneumoInhalerDevice.new
	end

    def create
        @inhaler_device = PneumoInhalerDevice.new(inhaler_device_params)

        if @inhaler_device.save
            flash[:success] = "Dispositivo adicionado"
            redirect_to pneumo_inhaler_devices_path()
        else
            render :index
        end
    end

    def edit
    end

    def update
        if @inhaler_device.update(inhaler_device_params)
            flash[:success] = "Dispositivo atualizado"
            redirect_to pneumo_inhaler_devices_path()
        else
            render :edit
        end
    end

	private

    def inhaler_device_params
        params.require(:pneumo_inhaler_device).permit(
            :pneumo_devices_category_id,
            :designacao,
            :dci,
            :ativo
        )
    end

    def load_devices_and_categories
        @inhaler_devices = PneumoInhalerDevice.order(:designacao)
        @devices_categories = PneumoDevicesCategory.order(:categoria)
    end

    def set_device
        @inhaler_device = PneumoInhalerDevice.find(params[:id])
    end

	def check_authorization
		authorize InhalerDevices
	end

end
