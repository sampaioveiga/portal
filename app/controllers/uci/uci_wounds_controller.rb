class Uci::UciWoundsController < ApplicationController
	before_action :check_auhorization
	respond_to :html, :js
	after_action :verify_authorized, only: [ :create, :edit, :update ]

	def new
		@patient = Patient.find(params[:patient_id])
	end

	def create
		@patient = Patient.find(params[:patient_id])
		if @uci_wound = @patient.uci_wounds.create(uci_wound_params)
			flash[:success] = "Registo de ferido efetuado"
			redirect_to uci_patient_path(@patient)
		else
			render :new
		end
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
		redirect_to uci_patient_path(@patient)
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

	def check_auhorization
		authorize [:uci, UciWound]
	end
end