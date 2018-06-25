class Ppcira::HigMaosUsersController < ApplicationController
  before_action :authenticate_user!
	before_action :check_authorization
	before_action :set_hig_maos_user, only: [ :edit, :update, :destroy ]
	before_action :load_select
	after_action :verify_authorized, only: [ :index, :create, :edit, :update ]

	def index
		@user = HigMaosUser.new
	end

	def create
		@user = HigMaosUser.new(hig_maos_user_params)

		if @user.save
			flash[:success] = "Utilizador adicionado"
			redirect_to ppcira_hig_maos_users_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @user.update(hig_maos_user_params)
			flash[:success] = "Utilizador atualizado"
			redirect_to ppcira_hig_maos_users_path()
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		flash[:success] = "Utilizador retirado do módulo"
		redirect_to ppcira_hig_maos_users_path()
	end

	private

	def check_authorization
		authorize HigMaosUser
	end

	def load_select
		@users = User.joins(:hig_maos_user).order(:nome_utilizador)
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
	end

	def set_hig_maos_user
		@user = HigMaosUser.find(params[:id])
	end

	def hig_maos_user_params
		params.require(:hig_maos_user).permit(
			:user_id,
			:nivel_acesso
		)
	end

end