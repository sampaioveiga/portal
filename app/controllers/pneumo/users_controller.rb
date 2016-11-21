class Pneumo::UsersController < ApplicationController
	before_action :check_authorization
	before_action :load_users , only: [ :new, :index ]
	before_action :set_user, only: [ :edit, :update, :destroy ]
	after_action :verify_authorized, only: [ :index, :create, :edit, :update, :destroy ]

	def index
		@user = PneumoUser.new
	end

	def create
		@user = PneumoUser.new(pneumo_user_params)

		if @user.save
			flash[:success] = "utilizador adicionado"
			redirect_to pneumo_users_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update(pneumo_user_params)
			flash[:success] = "Permissões do utilizador atualizadas"
			redirect_to pneumo_users_path
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		flash[:success] = "Utilizador eliminado"
		redirect_to pneumo_users_url
	end

	private

	def pneumo_user_params
		params.require(:pneumo_user).permit(
			:user_id,
			:nivel_acesso,
			:supervisor
		)
	end

	def load_users
		@users = User.joins(:pneumo_user).order(:nome_utilizador)
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
	end

	def set_user
		@user = PneumoUser.find(params[:id])
	end

	def check_authorization
		authorize [:pneumo, User]
	end

end