class EscalaVmerMapsController < ApplicationController
	#before_action :has_access
	
	def index
		@schedules = EscalaVmerSchedule.where(escalado: true)
	end

	private

	def has_access
		redirect_to root_url() unless (current_user.administrator || current_user.escala_vmer_user.present?)
	end

end