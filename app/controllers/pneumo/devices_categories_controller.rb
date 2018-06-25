class Pneumo::DevicesCategoriesController < ApplicationController
  before_action :authenticate_user!
    before_action :check_authorization
    before_action :set_devices_category, only: [ :edit, :update ]
    #after_action

    def index
        @devices_categories = PneumoDevicesCategory.order(:categoria)
        @devices_category = PneumoDevicesCategory.new
    end

    def create
        @devices_category = PneumoDevicesCategory.new(devices_category_params)

        if @devices_category.save
            flash[:success] = "Categoria adicionada"
            redirect_to pneumo_devices_categories_path()
        else
            render :index
        end
    end

    def edit
    end

    def update
        if @devices_category.update(devices_category_params)
            flash[:success] = "Categoria atualizada"
            redirect_to pneumo_devices_categories_path()
        else
            render :edit
        end
    end

    private

    def devices_category_params
        params.require(:pneumo_devices_category).permit(
            :categoria
        )
    end

    def set_devices_category
        @devices_category = PneumoDevicesCategory.find(params[:id])
    end

    def check_authorization
        authorize PneumologyForm
    end

end
