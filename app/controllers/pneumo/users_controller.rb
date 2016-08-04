class Pneumo::UsersController < ApplicationController
	before_action :check_authorization
	before_action :load_users , only: [ :new, :index ]
	after_action :verify_authorized, only: [ :index, :create, :edit, :update, :destroy ]

	def index
	end

	def new
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
		@user = PneumoUser.find(params[:id])
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

	def check_authorization
		authorize [:pneumo, User]
	end

end