class Uci::UciDevicePolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def show?
		(@current_user.uci_user.present? && @current_user.uci_user.devices != 0)
	end

	def create?
		(@current_user.uci_user.present? && @current_user.uci_user.devices == 2)
	end

	def edit?
		(@current_user.uci_user.present? && @current_user.uci_user.devices == 2)
	end

	def update?
		(@current_user.uci_user.present? && @current_user.uci_user.devices == 2)
	end
end