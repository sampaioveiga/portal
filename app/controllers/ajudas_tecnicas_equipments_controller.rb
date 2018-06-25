class AjudasTecnicasEquipmentsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_equipment, only: [ :edit, :update ]
	# user control

	def index
		@equipments = AjudasTecnicasEquipment.order(:equipamento)
	end

	def new
		@equipment = AjudasTecnicasEquipment.new
	end

	def create
		@equipment = AjudasTecnicasEquipment.new(equipment_params)

		if @equipment.save
			flash[:success] = "Equipamento criado"
			redirect_to ajudas_tecnicas_equipments_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @equipment.update(equipment_params)
			flash[:success] = "Equipamento modificado"
			redirect_to ajudas_tecnicas_equipments_path()
		else
			render :edit
		end
	end

	private

	def set_equipment
		@equipment = AjudasTecnicasEquipment.find(params[:id])
	end

	def equipment_params
		params.require(:ajudas_tecnicas_equipment).permit(
			:equipamento,
			:inventario,
			:descricao
		)
	end

end