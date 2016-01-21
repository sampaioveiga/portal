class TranspUsersController < ApplicationController
	before_action :load_select#, only: [ :index, :create ]
	before_action :is_user_admin
	#before_action :set_transp_user, only: [ :edit, :update ]

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
		@users = TranspUser.all
		@users_collection = User.order(:nome_utilizador)
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
		unless (current_user.administrator || current_user.transp_user.nivel_acesso == 2)
			redirect_to transp_user_trips_url()
		end
	end
end