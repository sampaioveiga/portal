class SatisfSurvSurveysController < ApplicationController
	before_action :authorize
	before_action :check_user_privileges
	before_action :set_survey, only: [ :edit, :update ]
	before_action :load_form_selects, only: [ :new, :create, :edit, :update ]

	def index
		@surveys = SatisfSurvSurvey.order(id: :desc).paginate(:page => params[:page])
	end

	def show
		@survey = SatisfSurvSurvey.find(params[:id])
	end

	def new
		@survey = SatisfSurvSurvey.new
		@survey.ulsne_site_id = current_user.ulsne_site.id
	end

	def create
		@survey = SatisfSurvSurvey.new(satisf_surv_survey_params)
		@survey.user = current_user

		if @survey.save
			flash[:success] = "Inquérito '#{@survey.id}' criado"
			redirect_to satisf_surv_surveys_path()
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @survey.update(satisf_surv_survey_params)
			flash[:success] = "Inquérito atualizado"
			redirect_to satisf_surv_survey_path(@survey)
		else
			render :edit
		end
	end

	private

	def set_survey
		@survey= SatisfSurvSurvey.find(params[:id])
	end

	def load_form_selects
		@departments = UlsneDepartment.order(:nome_servico)
		@sites = UlsneSite.order(:nome_unidade)
	end

	def satisf_surv_survey_params
		params.require(:satisf_surv_survey).permit(:user_id,
											:ulsne_site_id,
											:ulsne_department_id,
											:idade, 
											:sexo, 
											:escolaridade, 
											:simpatia_disponibilidade, 
											:informacao_esclarecimentos,
											:atencao_disponibilidade_medicos,
											:medicos_explicaram_doenca,
											:medicos_explicaram_medicacao,
											:desempenho_medicos,
											:atencao_disponibilizada_enfermeiros,
											:rapidez_servico_enfermagem,
											:desempenho_enfermeiros,
											:avaliacao_pessoal_auxiliar,
											:avaliacao_outros,
											:outros,
											:conforto_enfermarias,
											:limpeza_higiene,
											:protecao_enfermarias,
											:recomendaria_servico,
											:globalmente_satisfeito,
											:opiniao)
	end

	def check_user_privileges
		unless current_user.administrator
			if current_user.satisf_surv_user.nil? || current_user.satisf_surv_user.nivel_acesso == 0
				redirect_to root_url()
			end
		end
	end

end