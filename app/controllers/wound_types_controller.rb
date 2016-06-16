class WoundTypesController < ApplicationController
	#devise
	#pundit
	before_action :load_wound_types, only: [ :index, :create ]
	before_action :set_wound_type, only: [ :edit, :update ]
	#after pundit

	def index
		@wound_type = WoundType.new
	end

	def create
		@wound_type = WoundType.new(wound_type_params)

		if @wound_type.save
			flash[:success] = "Ferida registada"
			redirect_to wound_types_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @wound_type.update(wound_type_params)
			flash[:success] = "Ferida atualizada"
			redirect_to wound_types_path()
		else
			render :edit
		end
	end

	private

	def wound_type_params
		params.require(:wound_type).permit(
			:ferida
		)
	end

	def load_wound_types
		@wound_types = WoundType.order(:ferida)
	end

	def set_wound_type
		@wound_type = WoundType.find(params[:id])
	end

end