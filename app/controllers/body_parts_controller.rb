class BodyPartsController < ApplicationController
	before_action :check_authorization
	before_action :load_body_parts, only: [ :index, :create ]
	before_action :set_body_part, only: [ :edit, :update ]
	after_action :verify_authorized, only: [ :index, :edit, :update ]

	def index
		@body_parts = BodyPart.order('parte_do_corpo')
		@body_part = BodyPart.new
	end

	def create
		@body_part = BodyPart.new(body_part_params)

		if @body_part.save
			flash[:success] = "Parte do corpo criada"
			redirect_to body_parts_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @body_part.update(body_part_params)
			flash[:success] = "Parte do corpo atualizada"
			redirect_to body_parts_path()
		else
			render :edit
		end
	end

	private

	def body_part_params
		params.require(:body_part).permit(
			:parte_do_corpo
		)
	end

	def load_body_parts
		@body_parts = BodyPart.order('parte_do_corpo')
	end

	def set_body_part
		@body_part = BodyPart.find(params[:id])
	end

	def check_authorization
		authorize BodyPart
	end
end