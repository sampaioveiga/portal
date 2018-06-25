class Uci::UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :check_authorization
	before_action :find_user, only: [ :edit, :update, :destroy ]
	before_action :load_users
	after_action :verify_authorized, only: [ :index, :create, :edit, :update, :destroy ]

	def index
		@user = UciUser.new
	end

	def create
		@user = UciUser.new(uci_user_params)

		if @user.save
			flash[:success] = "Utilizador registado"
			redirect_to uci_users_path
		else
			render :edit
		end
	end

	def edit
	end

	def update
		if @user.update(uci_user_params)
			flash[:success] = "Permissões do utilizador atualizadas"
			redirect_to uci_users_path
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		flash[:success] = "Utilizador eliminado"
		redirect_to uci_users_url
	end

	private

	def uci_user_params
		params.require(:uci_user).permit(
			:user_id,
			:wounds,
			:devices,
			:tiss,
			:supervisor
		)
	end

	def load_users
		@users = User.joins(:uci_user).order(:nome_utilizador)
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
	end

	def find_user
		@user = UciUser.find(params[:id])
	end

	def check_authorization
		authorize [:uci, User]
	end
end