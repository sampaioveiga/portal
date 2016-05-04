class AjudasTecnicasLoansController < ApplicationController
	before_action :load_patient_loan_equipment, except: [ :create ]

	def create
		@patient = AjudasTecnicasPatient.find(params[:ajudas_tecnicas_patient_id])
		if @patient.obito.present?
			flash[:danger] = "O utente está falecido"
		else
			@loan = @patient.ajudas_tecnicas_loans.create(loan_params)
		end
		redirect_to @patient
	end

	def edit
	end

	def update
		if @loan.update(loan_params)
			flash[:success] = "Cedência alterada"
			redirect_to @patient
		else
			render :edit
		end
	end

	private

	def loan_params
		params.require(:ajudas_tecnicas_loan).permit(
			:cuidador,
			:inicio_cedencia,
			:fim_cedencia,
			:observacoes,
			:ajudas_tecnicas_patient_id,
			:ajudas_tecnicas_equipment_id
		)
	end

	def load_patient_loan_equipment
		@loan = AjudasTecnicasLoan.find(params[:id])
		@patient = @loan.ajudas_tecnicas_patient
		@ajudas_tecnicas_equipments = AjudasTecnicasEquipment.order(:equipamento)
	end

end