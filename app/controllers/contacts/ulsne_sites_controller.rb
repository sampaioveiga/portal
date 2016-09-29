class Contacts::UlsneSitesController < ApplicationController
	before_action :admin_authorize, only: [ :new, :create, :edit, :update ]
	before_action :set_ulsne_site, only: [ :edit, :update ]
	after_action :verify_authorized, only: [ :new, :create, :edit, :update ]

	def index
		@ulsne_sites = UlsneSite.order(:nome_unidade)
	end

	def new
		@ulsne_site = UlsneSite.new
	end

	def create
		@ulsne_site = UlsneSite.new(ulsne_site_params)

		if @ulsne_site.save
			flash[:success] = "Unidade #{@ulsne_site.nome_unidade} criada"
			redirect_to contacts_ulsne_sites_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @ulsne_site.update(ulsne_site_params)
			flash[:success] = "Unidade #{@ulsne_site.nome_unidade} atualizada"
			redirect_to contacts_ulsne_sites_path()
		else
			render :edit
		end
	end

	private

	def ulsne_site_params
		params.require(:ulsne_site).permit(:nome_unidade)
	end

	def set_ulsne_site
		@ulsne_site = UlsneSite.find(params[:id])
	end

	def admin_authorize
		authorize UlsneSite
	end
end