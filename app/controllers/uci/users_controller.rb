class Uci::UsersController < ApplicationController
	#before_action devise
	#before_action pundit
	before_action :load_users
	#after_action pundit

	def index
	end

	private

	def load_users
		@users = User.joins(:uci_user).order(:nome_utilizador)
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
	end
end