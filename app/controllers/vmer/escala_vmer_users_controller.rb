class Vmer::EscalaVmerUsersController < ApplicationController
  before_action :authenticate_user!
	before_action :check_authorization
	before_action :set_user, only: [ :edit, :update, :destroy ]
	before_action :load_selects, only: [ :index, :edit ]
	after_action :verify_authorized, only: [ :index, :create, :edit, :update ]

	def index
		@users = User.joins(:escala_vmer_user).order(:nome_utilizador)
		@user = EscalaVmerUser.new
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
	end

	def create
		@user = EscalaVmerUser.new(escala_vmer_user_params)

		if @user.save
			flash[:success] = "Utilizador adicionado"
			redirect_to vmer_escala_vmer_users_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @user.update(escala_vmer_user_params)
			flash[:success] = "Utilizador alterado"
			redirect_to vmer_escala_vmer_users_path()
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		flash[:success] = "Utilizador retirado do módulo"
		redirect_to vmer_escala_vmer_users_path()
	end

	private

	def check_authorization
		authorize EscalaVmerUser
	end

	def set_user
		@user = EscalaVmerUser.find(params[:id])
	end

	def load_selects
		@groups = EscalaVmerGroup.order(:nome_grupo)
	end

	def escala_vmer_user_params
		params.require(:escala_vmer_user).permit(
			:user_id,
			:escala_vmer_group_id,
			:nivel_acesso
		)
	end
end