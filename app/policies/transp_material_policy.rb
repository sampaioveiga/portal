class TranspMaterialPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def index?
		@current_user.transp_user.present? && @current_user.transp_user.nivel_acesso == 2
	end

	def calendar?
		@current_user.transp_user.present? && @current_user.transp_user.nivel_acesso != 0
	end

	def create?
		@current_user.transp_user.present? && @current_user.transp_user.nivel_acesso != 0
	end

	def edit?
		@current_user.transp_user.present? && @current_user.transp_user.nivel_acesso != 0
	end

	def update?
		@current_user.transp_user.present? && @current_user.transp_user.nivel_acesso != 0
	end

	def destroy?
		@current_user.transp_user.nivel_acesso == 2
	end
end