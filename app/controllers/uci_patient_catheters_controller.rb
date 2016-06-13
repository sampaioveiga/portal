class UciPatientCathetersController < ApplicationController
	#devise
	#pundit
	respond_to :html, :js
	#after pundit

	def create
		@patient = Patient.find(params[:patient_id])
		@uci_patient_catheter = @patient.uci_patient_catheters.create(uci_patient_catheter_params)
		redirect_to @patient
	end

	def edit
		@catheters = Catheter.order(:nome_cateter)
		@patient = Patient.find(params[:patient_id])
		@catheter = @patient.uci_patient_catheters.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:patient_id])
		@catheter = @patient.uci_patient_catheters.find(params[:id])

		if @catheter.update(uci_patient_catheter_params)
			flash[:success] = "Registo de cateter atualizado"
		end
		redirect_to @patient
	end

	private

	def uci_patient_catheter_params
		params.require(:uci_patient_catheter).permit(
			:patient_id,
			:user_id,
			:catheter_id,
			:data_introducao,
			:data_remocao,
			:observacao
		)
	end
end