class Vmer::EscalaVmerMapsController < ApplicationController
	before_action :check_authorization
	after_action :verify_authorized, only: [ :index, :create, :edit, :update ]
	
	def index
		@schedules = EscalaVmerSchedule.where(escalado: true)
	end

	private

	def check_authorization
		authorize EscalaVmerUser
	end

end