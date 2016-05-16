class Sagt::TranspUsersController < ApplicationController
	before_action :check_authorization
	before_action :set_transp_user, only: [ :edit, :update, :destroy ]
	before_action :load_select
	after_action :verify_authorized, only: [ :index, :create, :edit, :update ]

	def index
		@user = TranspUser.new
	end

	def create
		@user = TranspUser.new(transp_user_params)

		if @user.save
			flash[:success] = "Utilizador adicionado"
			redirect_to sagt_transp_users_url()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @user.update(transp_user_params)
			flash[:success] = "Utilizador atualizado"
			redirect_to sagt_transp_users_url()
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		flash[:success] = "Utilizador eliminado"
		redirect_to sagt_transp_users_url
	end

	private

	def load_select
		@users = User.joins(:transp_user).order(:nome_utilizador)
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
	end

	def set_transp_user
		@user = TranspUser.find(params[:id])
	end

	def transp_user_params
		params.require(:transp_user).permit(
			:user_id,
			:nivel_acesso
		)
	end

	def check_authorization
		authorize TranspUser
	end
end