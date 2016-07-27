class DeviceTypePolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@device_type = model
	end
	
	def index?
		@current_user.uci_user.supervisor?
	end

	def show?
		@current_user.uci_user.supervisor?
	end

	def create?
		@current_user.uci_user.supervisor?
	end

	def edit?
		@current_user.uci_user.supervisor?
	end

	def update?
		@current_user.uci_user.supervisor?
	end
end