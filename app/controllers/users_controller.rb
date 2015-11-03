class UsersController < ApplicationController

	def index
		@users = User.order(:nome_utilizador)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "Utilizador criado"
			redirect_to login_url()
		else
			render :new
		end
	end

	private

	def user_params
		params.require(:user).permit(:nome_utilizador,
									:numero_mecanografico,
									:email)
	end
end