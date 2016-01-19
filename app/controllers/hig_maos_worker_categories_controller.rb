class HigMaosWorkerCategoriesController < ApplicationController
	before_action :authorize
	before_action :is_user_admin
	before_action :load_categories, only: [ :index, :create ]
	before_action :set_category, only: [ :edit, :update ]

	def index
		@category = HigMaosWorkerCategory.new
	end

	def create
		@category = HigMaosWorkerCategory.new(hig_maos_worker_categories_params)

		if @category.save
			flash[:success] = "Categoria profissional criada"
			redirect_to hig_maos_worker_categories_path()
		else
			render :index
		end
	end

	def edit
	end

	def update
		if @category.update(hig_maos_worker_categories_params)
			flash[:success] = "Categoria profissional atualizada"
			redirect_to hig_maos_worker_categories_path()
		else
			render :edit
		end
	end

	private

	def set_category
		@category = HigMaosWorkerCategory.find(params[:id])
	end

	def load_categories
		@categories = HigMaosWorkerCategory.order(:categoria_profissional)
	end

	def hig_maos_worker_categories_params
		params.require(:hig_maos_worker_category).permit(
			:categoria_profissional
		)
	end

	def is_user_admin
		unless (current_user.administrator || current_user.hig_maos_user.nivel_acesso == 2)
			redirect_to hig_maos_observations_url()
		end
	end
end