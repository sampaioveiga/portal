class AjudasTecnicasPhysiciansController < ApplicationController
	before_action :authenticate_user!
	before_action :set_physician, only: [ :edit, :update ]

	def index
		@physicians = AjudasTecnicasPhysician.order(:nome_medico)
		@physician = AjudasTecnicasPhysician.new
	end

	def create
		@physician = AjudasTecnicasPhysician.new(ajudas_tecnicas_physician_params)

		if @physician.save
			flash[:success] = "Médico criado"
			redirect_to ajudas_tecnicas_physicians_url()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @physician.update(ajudas_tecnicas_physician_params)
			flash[:success] = "Médico atualizado"
			redirect_to ajudas_tecnicas_physicians_url()
		else
			render :edit
		end
	end

	private

	def has_access
		redirect_to ajudas_tecnicas_patients_url() unless ( current_user.administrator || current_user.ajudas_tecnicas_user.present? )
	end

	def set_physician
		@physician = AjudasTecnicasPhysician.find(params[:id])
	end

	def ajudas_tecnicas_physician_params
		params.require(:ajudas_tecnicas_physician).permit(
			:nome_medico
		)
	end
end