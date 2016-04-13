class UsersController < ApplicationController
	before_action :authorize, only: [ :index ]
	before_action :load_selects, only: [ :new, :create, :edit, :update ]
	before_action :set_user, only: [ :show, :edit, :update ]
	before_action :user_edit_permition, except: [ :new, :create, :show, :edit, :update ]
	before_action :edit_own_user , only: [ :show, :edit, :update ]

	def index
		@q = User.order(:nome_utilizador).ransack(params[:q])
		@users = @q.result.paginate(:page => params[:page], :per_page => 10 )
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.administrator = true if User.first.nil?

		if @user.save
			UserMailer.welcome_email(@user).deliver_now
			flash[:success] = "Utilizador criado"
			redirect_to login_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "#{@user.nome_utilizador} atualizado"
			UserMailer.welcome_email(@user).deliver_now
			redirect_to users_path()
		else
			render :edit
		end
	end

	private

	def user_edit_permition
		redirect_to root_url() unless current_user.administrator?
	end

	def edit_own_user
		 redirect_to root_url() unless (current_user.administrator? || @user.id == current_user.id)
	end

	def load_selects
		@ulsne_sites = UlsneSite.order(:nome_unidade)
		@ulsne_departments = UlsneDepartment.order(:nome_servico)
	end

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
end