class Uci::PatientsController < ApplicationController
	before_action :check_authorization
	before_action :load_dependencies, only: [ :show ]
	after_action :verify_authorized, only: [ :show ]

	def show
		@patient = Patient.find(params[:id])
	end

	def processo_sonho
		@patient = Patient.find_by(numero_processo_sonho: params[:id])
		if @patient.nil?
			redirect_to new_patient_path(numero_processo_sonho: params[:id])
		else
			render :show
		end
	end

	private

	def patient_params
		params.require(:patient).permit(
			:nome,
			:data_nascimento,
			:rnu,
			:nif,
			:numero_processo_sonho,
		)
	end

	def load_dependencies
		@device_types = DeviceType.order(:nome_dispositivo)
		@wound_types = WoundType.order(:ferida)
		@body_parts = BodyPart.order(:parte_do_corpo)
	end

	def check_authorization
		authorize [:uci, Patient]
	end
end