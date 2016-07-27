class PatientsController < ApplicationController
	before_action :check_authorization
	before_action :load_patient, only: [ :show, :edit, :update ]
	before_action :load_dependencies, only: [ :show, :processo_sonho ]
	after_action :verify_authorized, only: [ :index, :show, :edit, :update ]

	def index
		@q = Patient.ransack(params[:q])
		@patients = @q.result(distinct: true).order(:nome).limit(5)
	end

	def show
	end

	def processo_sonho
		@patient = Patient.find_by(numero_processo_sonho: params[:id])
		if @patient.nil?
			redirect_to new_patient_path(numero_processo_sonho: params[:id])
		else
			render :show
		end
	end

	def map_tiss_28
		@tiss = UciTissValue.day(Date.yesterday).includes(:patient)
	end

	def new
		@patient = Patient.new
		@patient.numero_processo_sonho = params[:numero_processo_sonho]
	end

	def create
		@patient = Patient.new(patient_params)

		if @patient.save
			flash[:success] = "Doente criado"
			redirect_to patient_path(@patient)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @patient.update(patient_params)
			flash[:success] = "Ficha atualizada"
			redirect_to patient_path(@patient)
		else
			render :edit
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

	def load_patient
		@patient = Patient.find(params[:id])
	end

	def load_dependencies
		@device_types = DeviceType.order(:nome_dispositivo)
		@wound_types = WoundType.order(:ferida)
		@body_parts = BodyPart.order(:parte_do_corpo)
	end

	def check_authorization
		authorize Patient
	end
end