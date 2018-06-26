require "administrate/base_dashboard"

class UlsneDepartmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    u2d_associations: Field::HasMany,
    users: Field::HasMany,
    ulsne_sites: Field::HasMany,
    office_phone_numbers: Field::HasMany,
    transp_user_trips: Field::HasMany,
    hig_maos_observations: Field::HasMany,
    id: Field::Number,
    nome_servico: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :u2d_associations,
    :users,
    :ulsne_sites,
    :office_phone_numbers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :u2d_associations,
    :users,
    :ulsne_sites,
    :office_phone_numbers,
    :transp_user_trips,
    :hig_maos_observations,
    :id,
    :nome_servico,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :u2d_associations,
    :users,
    :ulsne_sites,
    :office_phone_numbers,
    :transp_user_trips,
    :hig_maos_observations,
    :nome_servico,
  ].freeze

  # Overwrite this method to customize how ulsne departments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ulsne_department)
  #   "UlsneDepartment ##{ulsne_department.id}"
  # end
end
