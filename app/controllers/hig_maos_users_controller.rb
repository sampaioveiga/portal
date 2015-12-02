class HigMaosUsersController < ApplicationController
	before_action :authorize
	before_action :is_admin
	before_action :set_user, only: [ :edit, :update ]

	def index
		@users = HigMaosUser.all
		@user = HigMaosUser.new
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users)
	end

	def create
		@user = HigMaosUser.new(hig_maos_user_params)

		if @user.save
			flash[:success] = "Utilizador adicionado"
			redirect_to hig_maos_users_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @user.update(hig_maos_user_params)
			flash[:success] = "Utilizador atualizado"
			redirect_to hig_maos_users_path()
		else
			render :edit
		end
	end

	private

	def set_user
		@user = HigMaosUser.find(params[:id])
	end

	def hig_maos_user_params
		params.require(:hig_maos_user).permit(
			:user_id,
			:nivel_acesso
		)
	end
end