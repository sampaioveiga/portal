require "administrate/base_dashboard"

class OfficePhoneNumberDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ulsne_department: Field::BelongsTo,
    ulsne_site: Field::BelongsTo,
    id: Field::Number,
    nome_gabinete: Field::String,
    numero_gabinete: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :ulsne_department,
    :ulsne_site,
    :id,
    :nome_gabinete,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :ulsne_department,
    :ulsne_site,
    :id,
    :nome_gabinete,
    :numero_gabinete,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ulsne_department,
    :ulsne_site,
    :nome_gabinete,
    :numero_gabinete,
  ].freeze

  # Overwrite this method to customize how office phone numbers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(office_phone_number)
  #   "OfficePhoneNumber ##{office_phone_number.id}"
  # end
end
