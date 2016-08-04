class UciTissValuesController < ApplicationController
	#before_action :check_auhorization
	before_action :prequisites, only: [ :new, :create ]
	#after_action :verify_authorized, only: [ :create ]

	def new
		@uci_tiss_value = UciTissValue.new
		@uci_tiss_value.data = Date.today
	end

	def create
		@uci_tiss_value = UciTissValue.new(uci_tiss_value_params)

		@uci_tiss_value.user_id = current_user.id
		@uci_tiss_value.patient_id = params[:patient_id]

		if @uci_tiss_value.save
			flash[:success] = "TISS calculado"
			redirect_to patient_path(@patient)
		else
			render :new
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

	def prequisites
		@patient = Patient.find(params[:patient_id])
	end

	def check_auhorization
		authorize [:uci, UciTissValue]
	end
end