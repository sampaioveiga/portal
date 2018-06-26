require "administrate/base_dashboard"

class PatientDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    uci_devices: Field::HasMany,
    uci_wounds: Field::HasMany,
    uci_tiss_values: Field::HasMany,
    pneumology_forms: Field::HasMany,
    id: Field::Number,
    nome: Field::String,
    data_nascimento: Field::DateTime,
    rnu: Field::Number,
    nif: Field::Number,
    numero_processo_sonho: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :uci_devices,
    :uci_wounds,
    :uci_tiss_values,
    :pneumology_forms,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :uci_devices,
    :uci_wounds,
    :uci_tiss_values,
    :pneumology_forms,
    :id,
    :nome,
    :data_nascimento,
    :rnu,
    :nif,
    :numero_processo_sonho,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :uci_devices,
    :uci_wounds,
    :uci_tiss_values,
    :pneumology_forms,
    :nome,
    :data_nascimento,
    :rnu,
    :nif,
    :numero_processo_sonho,
  ].freeze

  # Overwrite this method to customize how patients are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(patient)
  #   "Patient ##{patient.id}"
  # end
end
