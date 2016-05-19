class Ppcira::HigMaosObservationsController < ApplicationController
	before_action :check_authorization, only: [ :index, :new, :create, :edit, :update, :stats, :export, :destroy ]
	before_action :load_departments_categories, only: [ :new, :create, :edit, :update ]
	before_action :load_observations, only: [ :index, :stats, :export ]
	before_action :set_observation, only: [ :show, :edit, :update, :destroy ]
	after_action :verify_authorized, only: [ :index, :new, :create, :edit, :update, :stats, :export, :destroy ]

	def index
	end

	def show
	end

	def stats
		if params[:date].nil?
			@date = Date.today
		else
			date = params[:date]
			@date = date.to_date
		end
		range = @date.beginning_of_month..@date.end_of_month
		@observations = @observations.where(inicio_sessao: range)
		@obs = HigMaosObservation.joins(:user).where(inicio_sessao: range)
	end

	def export
		@sites = UlsneSite.joins(:hig_maos_observations).uniq
	end

	def new
		@observation = HigMaosObservation.new
		@observation.user_id = current_user.id
		@observation.ulsne_site_id = current_user.ulsne_site.id
		@observation.fim_sessao = Time.now + 20.minute
	end

	def create
		@observation = HigMaosObservation.new(hig_maos_observation_params)
		@observation.user_id = current_user.id

		if @observation.save
			flash[:success] = "Observação criada"
			redirect_to ppcira_hig_maos_observations_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @observation.update(hig_maos_observation_params)
			flash[:success] = "Observação atualizada"
			redirect_to ppcira_hig_maos_observation_path(@observation)
		else
			render :edit
		end
	end

	def destroy
	end

	private

	def check_authorization
		authorize HigMaosObservation
	end

	def set_observation
		@observation = HigMaosObservation.find(params[:id])
	end

	def load_departments_categories
		if current_user.hig_maos_user.nivel_acesso == 2
			@users = User.joins(:hig_maos_user)
			@departments = UlsneDepartment.order(:nome_servico)
			@sites = UlsneSite.order(:nome_unidade)
		else
			@users = [current_user]
			@departments = current_user.ulsne_departments.order(:nome_servico)
			@sites = [current_user.ulsne_site]
		end
		@categories = HigMaosWorkerCategory.order(:categoria_profissional)
	end

	def load_observations
		if @current_user.hig_maos_user.nivel_acesso == 2
			@observations = HigMaosObservation.includes(:user, :ulsne_site)
		else
			@observations = @current_user.hig_maos_observations
		end
	end

	def hig_maos_observation_params
		params.require(:hig_maos_observation).permit(
			:inicio_sessao,
			:fim_sessao,
			:ulsne_site_id,
			:ulsne_department_id,
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

end