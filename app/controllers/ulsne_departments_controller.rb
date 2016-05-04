class UlsneDepartmentsController < ApplicationController
	#before_action :is_admin, except: [ :show, :update ]
	before_action :set_ulsne_department, only: [ :show, :edit, :update ]
	before_action :load_selects, only: [ :show, :new, :create, :edit, :update ]
	

	def index
		@ulsne_departments = UlsneDepartment.order(:nome_servico)
	end

	def show
	end

	def new
		@ulsne_department = UlsneDepartment.new
	end

	def create
		@ulsne_department = UlsneDepartment.new(ulsne_department_params)

		if @ulsne_department.save
			flash[:success] = "Serviço #{@ulsne_department.nome_servico} criado"
			redirect_to ulsne_departments_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @ulsne_department.update(ulsne_department_params)
			flash[:success] = "Serviço #{@ulsne_department.nome_servico} atualizado"
			redirect_to ulsne_departments_path()
		else
			render :edit
		end
	end

	private

	def ulsne_department_params
		params.require(:ulsne_department).permit(
			:nome_servico,
			office_phone_numbers_attributes: [
				:id, 
				:nome_gabinete,
				:numero_gabinete,
				:ulsne_site_id,
				:_destroy])
	end

	def set_ulsne_department
		@ulsne_department = UlsneDepartment.find(params[:id])
	end

	def load_selects
		@ulsne_sites = UlsneSite.order(:nome_unidade)
	end
end