class EscalaVmerSchedulePolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def index?
		@current_user.escala_vmer_user.present?
	end

	def create?
		@current_user.escala_vmer_user.present?
	end

	def edit?
		@current_user.escala_vmer_user.present?
	end

	def update?
		@current_user.escala_vmer_user.present?
	end

	def destroy?
		@current_user.escala_vmer_user.present?
	end
end