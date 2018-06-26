require "administrate/base_dashboard"

class AjudasTecnicasPatientDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ajudas_tecnicas_physician: Field::BelongsTo,
    ajudas_tecnicas_contacts: Field::HasMany,
    ajudas_tecnicas_loans: Field::HasMany,
    id: Field::Number,
    nome_doente: Field::String,
    ddn: Field::DateTime,
    rnu: Field::Number,
    sexo: Field::String,
    morada: Field::String,
    cpostal: Field::Number,
    cpostal2: Field::Number,
    localidade: Field::String,
    obito: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :ajudas_tecnicas_physician,
    :ajudas_tecnicas_contacts,
    :ajudas_tecnicas_loans,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :ajudas_tecnicas_physician,
    :ajudas_tecnicas_contacts,
    :ajudas_tecnicas_loans,
    :id,
    :nome_doente,
    :ddn,
    :rnu,
    :sexo,
    :morada,
    :cpostal,
    :cpostal2,
    :localidade,
    :obito,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ajudas_tecnicas_physician,
    :ajudas_tecnicas_contacts,
    :ajudas_tecnicas_loans,
    :nome_doente,
    :ddn,
    :rnu,
    :sexo,
    :morada,
    :cpostal,
    :cpostal2,
    :localidade,
    :obito,
  ].freeze

  # Overwrite this method to customize how ajudas tecnicas patients are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ajudas_tecnicas_patient)
  #   "AjudasTecnicasPatient ##{ajudas_tecnicas_patient.id}"
  # end
end
