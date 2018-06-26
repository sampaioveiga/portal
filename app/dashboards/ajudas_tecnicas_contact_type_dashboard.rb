require "administrate/base_dashboard"

class AjudasTecnicasContactTypeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ajudas_tecnicas_contacts: Field::HasMany,
    id: Field::Number,
    tipo_contacto: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :ajudas_tecnicas_contacts,
    :id,
    :tipo_contacto,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :ajudas_tecnicas_contacts,
    :id,
    :tipo_contacto,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ajudas_tecnicas_contacts,
    :tipo_contacto,
  ].freeze

  # Overwrite this method to customize how ajudas tecnicas contact types are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ajudas_tecnicas_contact_type)
  #   "AjudasTecnicasContactType ##{ajudas_tecnicas_contact_type.id}"
  # end
end
