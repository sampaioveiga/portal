class UciWoundsController < ApplicationController
	#devise
	#pundit
	respond_to :html, :js
	#after pundit

	def create
		@patient = Patient.find(params[:patient_id])
		@uci_wound = @patient.uci_wounds.create(uci_wound_params)
		flash[:success] = "Registo de ferido efetuado"
		redirect_to @patient
	end

	def edit
		@wound_types = WoundType.order(:ferida)
		@body_parts = BodyPart.order(:parte_do_corpo)
		@patient = Patient.find(params[:patient_id])
		@wound = @patient.uci_wounds.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:patient_id])
		@wound = @patient.uci_wounds.find(params[:id])

		if @wound.update(uci_wound_params)
			flash[:success] = "Registo de ferida atualizado"
		end
		redirect_to patient_path(@patient)
	end

	private

	def uci_wound_params
		params.require(:uci_wound).permit(
			:patient_id,
			:user_id,
			:wound_type_id,
			:body_part_id,
			:data_registo,
			:origem,
			:complicacoes,
			:antibioticos,
			:observacoes
		)
	end
end