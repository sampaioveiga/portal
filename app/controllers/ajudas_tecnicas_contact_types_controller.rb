class AjudasTecnicasContactTypesController < ApplicationController
	before_action :authorize
	before_action :has_access
	before_action :load_contact_types, only: [ :index, :create ]

	def index
		@contact_type = AjudasTecnicasContactType.new
	end

	def create
		@contact_type = AjudasTecnicasContactType.new(contact_type_params)

		if @contact_type.save
			flash[:success] = "Tipo de contacto criado"
			redirect_to ajudas_tecnicas_contact_types_path()
		else
			render :index
		end
	end

	private

	def contact_type_params
		params.require(:ajudas_tecnicas_contact_type).permit(
			:tipo_contacto
		)
	end

	def load_contact_types
		@contact_types = AjudasTecnicasContactType.order(:tipo_contacto)
	end

	def has_access
		redirect_to ajudas_tecnicas_patients_url() unless ( current_user.administrator || current_user.ajudas_tecnicas_user.nivel_acesso == 2)
	end
end