class CathetersController < ApplicationController
	#devise
	#pundit
	before_action :new_catheter, only: [ :index, :new ]
	before_action :load_catheter, only: [ :edit, :update ]
	# after pundit

	def index
		@catheters = Catheter.order(:nome_cateter)
	end

	def new
	end

	def create
		@catheter = Catheter.new(catheter_params)

		if @catheter.save
			flash[:success] = "Tipo de cateter adicionado"
			redirect_to catheters_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @catheter.update(catheter_params)
			flash[:success] = 'Tipo de cateter atualizado'
			redirect_to catheters_path
		else
			render :edit
		end
	end

	private

	def catheter_params
		params.require(:catheter).permit(
			:nome_cateter
		)
	end

	def new_catheter
		@catheter = Catheter.new
	end

	def load_catheter
		@catheter = Catheter.find(params[:id])
	end
end