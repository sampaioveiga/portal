class SatisfSurvUsersController < ApplicationController
	before_action :authorize
	before_action :has_access
	before_action :set_user, only: [ :edit, :update, :destroy ]

	def index
		@users = SatisfSurvUser.all
		@user = SatisfSurvUser.new
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
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

	def destroy
		@user.destroy
		flash[:success] = "Utilizador retirado do módulo"
		redirect_to satisf_surv_users_path()
	end

	private

	def set_user
		@user = SatisfSurvUser.find(params[:id])
	end

	def has_access
		redirect_to satisf_surv_surveys_url() unless (current_user.administrator || current_user.satisf_surv_user.nivel_acesso == 2)
	end

	def satisf_surv_user_params
		params.require(:satisf_surv_user).permit(
			:user_id,
			:nivel_acesso
		)
	end
end