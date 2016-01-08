class HigMaosObservationsController < ApplicationController
	before_action :authorize
	before_action :check_user_privileges
	before_action :load_departments_categories, only: [ :new, :create, :edit, :update ]
	before_action :load_observations, only: [ :index, :stats ]
	before_action :set_observation, only: [ :show, :edit, :update ]

	def index
	end

	def show
	end

	def stats
		@sites = UlsneSite.joins(:hig_maos_observations).uniq
	end

	def new
		@observation = HigMaosObservation.new
		@observation.ulsne_site_id = current_user.ulsne_site.id
		@observation.fim_sessao = Time.now + 1.hour
	end

	def create
		@observation = HigMaosObservation.new(hig_maos_observation_params)
		@observation.user_id = current_user.id

		if @observation.save
			flash[:success] = "Observação criada"
			redirect_to hig_maos_observations_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @observation.update(hig_maos_observation_params)
			flash[:success] = "Observação atualizada"
			redirect_to @observation
		else
			render :edit
		end
	end

	private

	def set_observation
		@observation = HigMaosObservation.find(params[:id])
	end

	def load_departments_categories
		@sites = UlsneSite.order(:nome_unidade)
		@categories = HigMaosWorkerCategory.order(:categoria_profissional)
	end

	def load_observations
		@observations = HigMaosObservation.includes(:user, :ulsne_site)
	end

	def hig_maos_observation_params
		params.require(:hig_maos_observation).permit(
			:inicio_sessao,
			:fim_sessao,
			:ulsne_site_id,
			:user_id,
			hig_maos_opportunities_clusters_attributes: [
				:id, 
				:numero_profissionais,
				:hig_maos_worker_category_id,
				:_destroy,
				hig_maos_opportunities_attributes: [
					:id,
					:antes_doente,
					:antes_assetico,
					:apos_sangue_fluido,
					:apos_doente,
					:apos_ambiente,
					:friccao_antisetica,
					:lavagem,
					:nao_realizado,
					:_destroy
				]
			]
		)
	end

	def check_user_privileges
		unless current_user.administrator
			if current_user.hig_maos_user.nil? || current_user.hig_maos_user.nivel_acesso == 0
				redirect_to root_url()
			end
		end
	end
end