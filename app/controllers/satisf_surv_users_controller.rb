class SatisfSurvUsersController < ApplicationController
	before_action :authorize
	before_action :is_admin
	before_action :set_user, only: [ :edit, :update ]

	def index
		@users = SatisfSurvUser.all
		@user = SatisfSurvUser.new
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users)
	end

	def create
		@user = SatisfSurvUser.new(satisf_surv_user_params)

		if @user.save
			flash[:success] = "Utilizador adicionado"
			redirect_to satisf_surv_users_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @user.update(satisf_surv_user_params)
			flash[:success] = "Utilizador atualizado"
			redirect_to satisf_surv_users_path()
		else
			render :edit
		end
	end

	private

	def set_user
		@user = SatisfSurvUser.find(params[:id])
	end

	def satisf_surv_user_params
		params.require(:satisf_surv_user).permit(:user_id,
												:nivel_acesso)
	end
end