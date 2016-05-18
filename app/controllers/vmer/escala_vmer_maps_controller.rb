class Vmer::EscalaVmerMapsController < ApplicationController
	before_action :check_authorization
	after_action :verify_authorized
	
	def index
		@schedules = EscalaVmerSchedule.where(escalado: true)
	end

	private

	def check_authorization
		authorize EscalaVmerSchedule
	end

end