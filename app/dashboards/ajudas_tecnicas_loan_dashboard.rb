require "administrate/base_dashboard"

class AjudasTecnicasLoanDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ajudas_tecnicas_patient: Field::BelongsTo,
    ajudas_tecnicas_equipment: Field::BelongsTo,
    id: Field::Number,
    cuidador: Field::String,
    inicio_cedencia: Field::DateTime,
    fim_cedencia: Field::DateTime,
    observacoes: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :ajudas_tecnicas_patient,
    :ajudas_tecnicas_equipment,
    :id,
    :cuidador,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :ajudas_tecnicas_patient,
    :ajudas_tecnicas_equipment,
    :id,
    :cuidador,
    :inicio_cedencia,
    :fim_cedencia,
    :observacoes,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ajudas_tecnicas_patient,
    :ajudas_tecnicas_equipment,
    :cuidador,
    :inicio_cedencia,
    :fim_cedencia,
    :observacoes,
  ].freeze

  # Overwrite this method to customize how ajudas tecnicas loans are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ajudas_tecnicas_loan)
  #   "AjudasTecnicasLoan ##{ajudas_tecnicas_loan.id}"
  # end
end
