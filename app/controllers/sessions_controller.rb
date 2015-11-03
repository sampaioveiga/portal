class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by_numero_mecanografico(params[:numero_mecanografico])
		if user #&& user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success] = "Bem-vindo, #{current_user.nome_utilizador}"
			redirect_to root_url()
		else
			flash[:danger] = "Utilizador ou password inválidas"
			redirect_to login_url()
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Sessão terminada"
		redirect_to root_url
	end

end