require "administrate/base_dashboard"

class UlsneSiteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    office_phone_numbers: Field::HasMany,
    ulsne_departments: Field::HasMany,
    hig_maos_observations: Field::HasMany,
    id: Field::Number,
    nome_unidade: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    telefone: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :users,
    :office_phone_numbers,
    :ulsne_departments,
    :hig_maos_observations,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :office_phone_numbers,
    :ulsne_departments,
    :hig_maos_observations,
    :id,
    :nome_unidade,
    :created_at,
    :updated_at,
    :telefone,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    :office_phone_numbers,
    :ulsne_departments,
    :hig_maos_observations,
    :nome_unidade,
    :telefone,
  ].freeze

  # Overwrite this method to customize how ulsne sites are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ulsne_site)
  #   "UlsneSite ##{ulsne_site.id}"
  # end
end
