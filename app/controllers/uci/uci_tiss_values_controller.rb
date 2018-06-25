class Uci::UciTissValuesController < ApplicationController
  before_action :authenticate_user!
	before_action :check_auhorization
	after_action :verify_authorized, only: [ :create ]

	def create
		@patient = Patient.find(params[:patient_id])
		if @patient.uci_tiss_values.create(uci_tiss_value_params)
			flash[:success] = "TISS calculado"
			redirect_to patient_path(@patient)
		else
			flash[:danger] = "Erro"
			redirect_to patient_path(@patient)
		end
	end

	private

	def uci_tiss_value_params
		params.require(:uci_tiss_value).permit(
			:patient_id,
			:user_id,
			:data,
			:b1_q1,
			:b1_q2,
			:b1_q3,
			:b1_q4,
			:b1_q5,
			:b1_q6,
			:b1_q7,
			:b2_q1,
			:b2_q2,
			:b2_q3,
			:b2_q4,
			:b3_q1,
			:b3_q2,
			:b3_q3,
			:b3_q4,
			:b3_q5,
			:b3_q6,
			:b3_q7,
			:b4_q1,
			:b4_q2,
			:b4_q3,
			:b5_q1,
			:b6_q1,
			:b6_q2,
			:b6_q3,
			:b7_q1,
			:b7_q2,
			:b7_q3
		)
	end

	def check_auhorization
		authorize [:uci, UciTissValue]
	end
end