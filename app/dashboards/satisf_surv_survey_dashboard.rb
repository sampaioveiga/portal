require "administrate/base_dashboard"

class SatisfSurvSurveyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    ulsne_department: Field::BelongsTo,
    ulsne_site: Field::BelongsTo,
    id: Field::Number,
    idade: Field::Number,
    sexo: Field::Number,
    escolaridade: Field::Number,
    simpatia_disponibilidade: Field::Number,
    informacao_esclarecimentos: Field::Number,
    atencao_disponibilidade_medicos: Field::Number,
    medicos_explicaram_doenca: Field::Number,
    medicos_explicaram_medicacao: Field::Number,
    desempenho_medicos: Field::Number,
    atencao_disponibilizada_enfermeiros: Field::Number,
    rapidez_servico_enfermagem: Field::Number,
    desempenho_enfermeiros: Field::Number,
    avaliacao_pessoal_auxiliar: Field::Number,
    avaliacao_outros: Field::Number,
    outros: Field::String,
    conforto_enfermarias: Field::Number,
    limpeza_higiene: Field::Number,
    protecao_enfermarias: Field::Number,
    recomendaria_servico: Field::Number,
    globalmente_satisfeito: Field::Number,
    opiniao: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :ulsne_site,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :ulsne_site,
    :id,
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
    :opiniao,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :ulsne_site,
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
    :opiniao,
  ].freeze

  # Overwrite this method to customize how satisf surv surveys are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(satisf_surv_survey)
  #   "SatisfSurvSurvey ##{satisf_surv_survey.id}"
  # end
end
