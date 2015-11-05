class UsersController < ApplicationController
	before_action :load_selects, only: [ :new, :create, :edit, :update ]
	before_action :set_user, only: [ :show, :edit, :update ]

	def index
		@users = User.order(:nome_utilizador).paginate(:page => params[:page], :per_page => 10 )
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

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "#{@user.nome_utilizador} atualizado"
			redirect_to users_path()
		else
			render :edit
		end
	end

	private

	def load_selects
		@ulsne_sites = UlsneSite.order(:nome_unidade)
		@ulsne_departments = UlsneDepartment.order(:nome_servico)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:titulo,
									:nome_utilizador,
									:numero_mecanografico,
									:email,
									:ulsne_site_id,
									u2d_associations_attributes: [ :id, :user_id, :ulsne_department_id, :_destroy ],
									user_phone_numbers_attributes: [ :id, :user_id, :numero_contacto, :_destroy])
	end
end