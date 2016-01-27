class TranspUsersController < ApplicationController
	before_action :authorize
	before_action :is_user_admin
	before_action :load_select

	def index
		@user = TranspUser.new
	end

	def create
		@user = TranspUser.new(transp_user_params)

		if @user.save
			flash[:success] = "Utilizador adicionado"
			redirect_to transp_users_url()
		else
			render :index
		end
	end

	def edit
		@user = TranspUser.find(params[:id])
	end

	def update
		@user = TranspUser.find(params[:id])

		if @user.update(transp_user_params)
			flash[:success] = "Utilizador atualizado"
			redirect_to transp_users_url()
		else
			render :edit
		end
	end

	private

	def load_select
		@users = User.joins(:transp_user).order(:nome_utilizador)
		users = @users.pluck(:user_id)
		@users_collection = User.where.not(id: users).order(:nome_utilizador)
	end

	def set_transp_user
		@transp_user = TranspUser.find(params[:id])
	end

	def transp_user_params
		params.require(:transp_user).permit(
			:user_id,
			:nivel_acesso
		)
	end

	def is_user_admin
		redirect_to transp_user_trips_url() unless (current_user.administrator || current_user.transp_user.nivel_acesso == 2)
	end
end