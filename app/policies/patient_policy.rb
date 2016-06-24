class PatientPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def index?
		@current_user.uci_user.present?
	end

	def show?
		@current_user.uci_user.present?
	end

	def processo_sonho?
		@current_user.uci_user.present?
	end

	def new?
		@current_user.uci_user.present?
	end

	def create?
		@current_user.uci_user.present?
	end

	def edit?
		@current_user.uci_user.present?
	end

	def update?
		@current_user.uci_user.present?
	end
end