class AjudasTecnicasUsersController < ApplicationController
	before_action :authorize
	before_action :is_user_admin
	before_action :set_user, only: [ :edit, :update, :destroy ]

	def index
		#@users = AjudasTecnicasUser.all
		@users = User.joins(:ajudas_tecnicas_user).order(:nome_utilizador)
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
		@user = AjudasTecnicasUser.new
	end

	def create
		@user = AjudasTecnicasUser.new(ajudas_tecnicas_user_params)

		if @user.save
			flash[:success] = "Utilizador adicionado"
			redirect_to ajudas_tecnicas_users_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @user.update(ajudas_tecnicas_user_params)
			flash[:success] = "Utilizador atualizado"
			redirect_to ajudas_tecnicas_users_path()
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		flash[:success] = "Utilizador retirado do módulo"
		redirect_to ajudas_tecnicas_users_path()
	end

	private

	def set_user
		@user = AjudasTecnicasUser.find(params[:id])
	end

	def is_user_admin
		redirect_to ajudas_tecnicas_patients_url() unless ( current_user.administrator || current_user.ajudas_tecnicas_user.nivel_acesso == 2 )
	end

	def ajudas_tecnicas_user_params
		params.require(:ajudas_tecnicas_user).permit(
			:user_id,
			:nivel_acesso
		)
	end

end