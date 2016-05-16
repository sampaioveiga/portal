class UlsneSitePolicy < ApplicationPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@ulsne_site = model
	end

	def new?
		@current_user.administrator?
	end

	def create?
		@current_user.administrator?
	end

	def edit?
		@current_user.administrator?
	end

	def update?
		@current_user.administrator?
	end
end