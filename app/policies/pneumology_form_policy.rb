class PneumologyFormPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@patient = model
	end

	def index?
		@current_user.pneumo_user.present? 
	end

	def show?
		@current_user.pneumo_user.present? && @current_user.pneumo_user.nivel_acesso != 0
	end

	def new?
		@current_user.pneumo_user.present? && @current_user.pneumo_user.nivel_acesso == 2
	end

	def create?
		@current_user.pneumo_user.present? && @current_user.pneumo_user.nivel_acesso == 2
	end

	def edit?
		@current_user.pneumo_user.present? && @current_user.pneumo_user.nivel_acesso == 2
	end

	def update?
		@current_user.pneumo_user.present? && @current_user.pneumo_user.nivel_acesso == 2
	end
end