class CatheterTypesController < ApplicationController
	#devise
	#pundit
	before_action :new_catheter_type, only: [ :index, :new ]
	before_action :load_catheter_type, only: [ :edit, :update ]
	# after pundit

	def index
		@catheter_types = CatheterType.order(:nome_cateter)
	end

	def new
	end

	def create
		@catheter_type = CatheterType.new(catheter_type_params)

		if @catheter_type.save
			flash[:success] = "Tipo de cateter adicionado"
			redirect_to catheter_types_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @catheter_type.update(catheter_type_params)
			flash[:success] = 'Tipo de cateter atualizado'
			redirect_to catheter_types_path
		else
			render :edit
		end
	end

	private

	def catheter_type_params
		params.require(:catheter_type).permit(
			:nome_cateter
		)
	end

	def new_catheter_type
		@catheter_type = CatheterType.new
	end

	def load_catheter_type
		@catheter_type = CatheterType.find(params[:id])
	end
end