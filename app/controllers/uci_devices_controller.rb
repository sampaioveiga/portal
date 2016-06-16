class UciDevicesController < ApplicationController
	#devise
	#pundit
	respond_to :html, :js
	#after pundit

	def create
		@patient = Patient.find(params[:patient_id])
		@uci_device = @patient.uci_devices.create(uci_device_params)
		flash[:success] = "Registo de dispositivo efetuado"
		redirect_to @patient, anchor: 'devices'
	end

	def edit
		@device_types = DeviceType.order(:nome_dispositivo)
		@patient = Patient.find(params[:patient_id])
		@device = @patient.uci_devices.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:patient_id])
		@device = @patient.uci_devices.find(params[:id])

		if @device.update(uci_device_params)
			flash[:success] = "Registo de dispositivo atualizado"
		end
		redirect_to patient_path(@patient)
	end

	private

	def uci_device_params
		params.require(:uci_device).permit(
			:patient_id,
			:user_id,
			:device_type_id,
			:data_introducao,
			:data_remocao,
			:observacao
		)
	end
end