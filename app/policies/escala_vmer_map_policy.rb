class EscalaVmerMapPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def index?
		(@current_user.escala_vmer_user.present? && @current_user.escala_vmer_user.nivel_acesso == 2) || @current_user.administrator?
	end

	def create?
		(@current_user.escala_vmer_user.present? && @current_user.escala_vmer_user.nivel_acesso == 2) || @current_user.administrator?
	end

	def edit?
		(@current_user.escala_vmer_user.present? && @current_user.escala_vmer_user.nivel_acesso == 2) || @current_user.administrator?
	end

	def update?
		(@current_user.escala_vmer_user.present? && @current_user.escala_vmer_user.nivel_acesso == 2) || @current_user.administrator?
	end

	def destroy?
		@current_user.escala_vmer_user.present? && @current_user.escala_vmer_user.nivel_acesso == 2
	end
end