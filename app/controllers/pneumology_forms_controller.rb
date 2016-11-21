
class PneumologyFormsController < ApplicationController
	before_action :check_authorization
	before_action :prerequisites, only: [ :new, :create, :edit, :update ]
	before_action :load_pneumo_form, only: [ :show, :edit, :update ]
	#after_action 

	def show
		@patient = @pneumology_form.patient
	end

	def new
		if @patient.pneumology_forms.last.nil?
			@pneumology_form = PneumologyForm.new(data: Date.today)
		else
			last_values = @patient.pneumology_forms.last
			@pneumology_form = PneumologyForm.new(
				data: Date.today,
				peso: last_values.peso,
				ta_s: last_values.ta_s,
				ta_d: last_values.ta_d,
				pulso: last_values.pulso,
				o2: last_values.o2,
				o2_note: last_values.o2_note,
				pef: last_values.pef,
				inaladores: last_values.inaladores,
				observacoes: last_values.observacoes
			)
			last_values.pneumo_forms_inhaler_devices.each do |dev|
				@pneumology_form.pneumo_forms_inhaler_devices.build([
					{
						pneumo_inhaler_device_id: dev.pneumo_inhaler_device_id,
						observacao: dev.observacao
					}
				])
			end
		end
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
		if @pneumology_form.update(pneumology_form_params)
			flash[:success] = "Ficha atualizada"
			redirect_to patient_path(@patient)
		else
			render :edit
		end
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
			:o2_note,
			:pef,
			:inaladores,
			:tecnica_inalatoria_antes,
			:tecnica_inalatoria_depois,
			:observacoes,
			pneumo_forms_inhaler_devices_attributes: 
				[ :id, :pneumo_inhaler_device_id, :observacao, :_destroy ]
		)
	end

	def load_pneumo_form
		@pneumology_form = PneumologyForm.find(params[:id])
	end

	def prerequisites
		@patient = Patient.find(params[:patient_id])
		@inhaler_devices = PneumoInhalerDevice.active.order('pneumo_devices_category_id ASC').reorder('designacao ASC')
	end

	def check_authorization
		authorize PneumologyForm
	end
end