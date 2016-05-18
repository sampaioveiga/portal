class HigMaosWorkerCategoryPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def index?
		@current_user.hig_maos_user.present? && @current_user.hig_maos_user.nivel_acesso == 2
	end

	def create?
		@current_user.hig_maos_user.present? && @current_user.hig_maos_user.nivel_acesso == 2
	end

	def edit?
		@current_user.hig_maos_user.present? && @current_user.hig_maos_user.nivel_acesso == 2
	end

	def update?
		@current_user.hig_maos_user.present? && @current_user.hig_maos_user.nivel_acesso == 2
	end

	def destroy?
		@current_user.hig_maos_user.present? && @current_user.hig_maos_user.nivel_acesso == 2
	end
end