class EscalaVmerMapsController < ApplicationController
	before_action :authorize
	before_action :check_access

	def index
		@schedules = EscalaVmerSchedule.where(escalado: true)
	end

	private

	def check_access
		redirect_to escala_vmer_users_path() unless (current_user.escala_vmer_user)
	end

end