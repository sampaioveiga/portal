class HigMaosUsersController < ApplicationController
	before_action :authorize
	before_action :is_user_admin
	before_action :set_user, only: [ :edit, :update, :destroy ]
	before_action :load_select


	def index
		@user = HigMaosUser.new
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

	def destroy
		@user.destroy
		flash[:success] = "Utilizador retirado do módulo"
		redirect_to hig_maos_users_path()
	end

	private

	def load_select
		@users = User.joins(:hig_maos_user).order(:nome_utilizador)
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
	end

	def set_user
		@user = HigMaosUser.find(params[:id])
	end

	def hig_maos_user_params
		params.require(:hig_maos_user).permit(
			:user_id,
			:nivel_acesso
		)
	end

	def is_user_admin
		redirect_to hig_maos_observations_url() unless (current_user.administrator || current_user.hig_maos_user.nivel_acesso == 2)
	end
end