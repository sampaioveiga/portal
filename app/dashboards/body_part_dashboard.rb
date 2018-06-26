require "administrate/base_dashboard"

class BodyPartDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    uci_wounds: Field::HasMany,
    id: Field::Number,
    parte_do_corpo: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :uci_wounds,
    :id,
    :parte_do_corpo,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :uci_wounds,
    :id,
    :parte_do_corpo,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :uci_wounds,
    :parte_do_corpo,
  ].freeze

  # Overwrite this method to customize how body parts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(body_part)
  #   "BodyPart ##{body_part.id}"
  # end
end
