class AjudasTecnicasPatientsController < ApplicationController
	#before_action :has_access
	before_action :user_just_reads, except: [ :index ]
	before_action :load_physicians, only: [ :new, :create, :edit, :update ]
	before_action :set_patient, only: [ :show, :edit, :update ]
	before_action :load_equipments, only: [ :show, :edit, :update ]


	def index
		@all_patients = AjudasTecnicasPatient.order(:nome_doente)
		@patients = @all_patients.group_by { |c| c.nome_doente[0].downcase }
	end

	def new
		@patient = AjudasTecnicasPatient.new
		@patient.cpostal = '5300'
		@patient.localidade = 'Bragança'
	end

	def create
		@patient = AjudasTecnicasPatient.new(patient_params)

		if @patient.save
			flash[:success] = "Utente criado"
			redirect_to ajudas_tecnicas_patients_url()
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @patient.update(patient_params)
			flash[:success] = "Utente atualizado"
			redirect_to @patient
		else
			render :edit
		end
	end

	private

	def set_patient
		@patient = AjudasTecnicasPatient.find(params[:id])
	end

	def load_equipments
		equipment_on_loan = AjudasTecnicasLoan.active.pluck(:ajudas_tecnicas_equipment_id)
		@ajudas_tecnicas_equipments = AjudasTecnicasEquipment.where.not(id: equipment_on_loan)
	end

	def patient_params
		params.require(:ajudas_tecnicas_patient).permit(
			:nome_doente,
			:contact_types_id, 
			:ddn, 
			:rnu, 
			:sexo, 
			:morada, 
			:cpostal, 
			:cpostal2, 
			:localidade, 
			:physician_id, 
			:obito,
			ajudas_tecnicas_contacts_attributes: [
				:id, 
				:ajudas_tecnicas_contact_type_id, 
				:contacto, 
				:_destroy
			]
		)
	end

	def load_physicians
		@physicians = AjudasTecnicasPhysician.order(:nome_medico)
	end

	def user_just_reads
		if current_user.ajudas_tecnicas_user.nivel_acesso == 0
			flash[:info] = "Só pode visualizar"
			redirect_to ajudas_tecnicas_patients_url()
		end
	end

	def has_access
		redirect_to root_url() unless ( current_user.administrator || current_user.ajudas_tecnicas_user.present?)
	end
end