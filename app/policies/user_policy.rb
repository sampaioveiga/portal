class UserPolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	def edit?
		@current_user.administrator?
	end

	def update?
		@current_user.administrator?
	end
end