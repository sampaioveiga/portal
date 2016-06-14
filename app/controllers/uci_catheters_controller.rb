class UciCathetersController < ApplicationController
	#devise
	#pundit
	respond_to :html, :js
	#after pundit

	def create
		@patient = Patient.find(params[:patient_id])
		@uci_catheter = @patient.uci_catheters.create(uci_catheter_params)
		flash[:success] = "Registo de cateter efetuado"
		redirect_to @patient
	end

	def edit
		@catheter_types = CatheterType.order(:nome_cateter)
		@patient = Patient.find(params[:patient_id])
		@catheter = @patient.uci_catheters.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:patient_id])
		@catheter = @patient.uci_catheters.find(params[:id])

		if @catheter.update(uci_catheter_params)
			flash[:success] = "Registo de cateter atualizado"
		end
		redirect_to @patient
	end

	private

	def uci_catheter_params
		params.require(:uci_catheter).permit(
			:patient_id,
			:user_id,
			:catheter_type_id,
			:data_introducao,
			:data_remocao,
			:observacao
		)
	end
end