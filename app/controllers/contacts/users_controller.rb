class Contacts::UsersController < ApplicationController
	before_action :admin_authorization, only: [ :edit, :update ]
	before_action :set_user, only: [ :show, :edit, :update ]
	after_action :verify_authorized, only: [ :edit, :update ]

	def index
		@q = User.order(:nome_utilizador).ransack(params[:q])
		@users = @q.result.includes(:ulsne_site).paginate(:page => params[:page], :per_page => 20 )
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "#{@user.nome_utilizador} atualizado"
			redirect_to contacts_users_path()
		else
			render :edit
		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(
			:titulo,
			:nome_utilizador,
			:numero_mecanografico,
			:email,
			:password,
			:password_confirmation,
			:ulsne_site_id,
			u2d_associations_attributes: [
				:id, 
				:user_id, 
				:ulsne_department_id, 
				:_destroy ],
			user_phone_numbers_attributes: [ 
				:id, 
				:user_id, 
				:numero_contacto, 
				:_destroy])
	end

	def admin_authorization
		authorize User
	end

end