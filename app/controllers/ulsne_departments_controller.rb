class UlsneDepartmentsController < ApplicationController
	before_action :set_ulsne_department, only: [ :edit, :update ]

	def index
		@ulsne_departments = UlsneDepartment.order(:nome_servico)
	end

	def new
		@ulsne_department = UlsneDepartment.new
	end

	def create
		@ulsne_department = UlsneDepartment.new(ulsne_department_params)

		if @ulsne_department.save
			flash[:success] = "Serviço #{@ulsne_department.nome_servico} criado"
			redirect_to root_url()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @ulsne_department.update(ulsne_department_params)
			flash[:success] = "Serviço #{@ulsne_department.nome_servico} atualizado"
			redirect_to root_url()
		else
			render :edit
		end
	end

	private

	def ulsne_department_params
		params.require(:ulsne_department).permit(:nome_servico)
	end

	def set_ulsne_department
		@ulsne_department = UlsneDepartment.find(params[:id])
	end
end