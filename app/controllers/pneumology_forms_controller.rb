
class PneumologyFormsController < ApplicationController
	before_action :check_authorization
	before_action :preriquisites, only: [ :new, :create ]
	before_action :load_pneumo_form, only: [ :show, :edit, :update ]
	#after_action 

	def show
		@patient = @pneumology_form.patient
	end

	def new
		@pneumology_form = PneumologyForm.new
		@pneumology_form.data = Date.today
	end

	def create
		@pneumology_form = PneumologyForm.new(pneumology_form_params)

		@pneumology_form.user_id = current_user.id
		@pneumology_form.patient_id = params[:patient_id]

		if @pneumology_form.save
			flash[:success] = "Formulário guardado"
			redirect_to patient_path(@patient)
		else
			render :new
		end
	end

	def edit
		@patient = @pneumology_form.patient
	end

	def update
	end

	private

	def pneumology_form_params
		params.require(:pneumology_form).permit(
			:user,
			:patient,
			:data,
			:peso,
			:ta_s,
			:ta_d,
			:pulso,
			:o2,
			:inaladores,
			:tecnica_inalatoria_antes,
			:tecnica_inalatoria_depois,
			:observacoes
		)
	end

	def load_pneumo_form
		@pneumology_form = PneumologyForm.find(params[:id])
	end

	def preriquisites
		@patient = Patient.find(params[:patient_id])
	end

	def check_authorization
		authorize PneumologyForm
	end
end