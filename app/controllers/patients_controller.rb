class PatientsController < ApplicationController
	#devise
	#pundit
	before_action :load_patient, only: [ :show, :edit, :update ]
	#after pundit

	def index
		@q = Patient.ransack(params[:q])
		@patients = @q.result(distinct: true).order(:nome).limit(5)
	end

	def show
		@catheter_types = CatheterType.order(:nome_cateter)
	end

	def processo_sonho
		@patient = Patient.find_by(numero_processo_sonho: params[:id])
		if @patient.nil?
			redirect_to new_patient_path(numero_processo_sonho: params[:id])
		else
			render :show
		end
	end

	def new
		@patient = Patient.new
		@patient.numero_processo_sonho = params[:numero_processo_sonho]
	end

	def create
		@patient = Patient.new(patient_params)

		if @patient.save
			flash[:success] = "Doente criado"
			redirect_to patients_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
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

	def load_patient
		@patient = Patient.find(params[:id])
	end
end