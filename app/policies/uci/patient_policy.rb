class Uci::PatientPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def show?
		@current_user.uci_user.present?
	end

	def processo_sonho?
		@current_user.uci_user.present?
	end
end