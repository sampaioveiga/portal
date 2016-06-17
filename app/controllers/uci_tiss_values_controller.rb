class UciTissValuesController < ApplicationController
	# devise
	#pundit

	#fet pundit

	def create
		@patient = Patient.find(params[:patient_id])
		@patient.uci_tiss_values.create(uci_tiss_value_params)
		redirect_to @patient
	end

	private

	def uci_tiss_value_params
		params.require(:uci_tiss_value).permit(
			:patient_id,
			:user_id,
			:data,
			:valor
		)
	end
end