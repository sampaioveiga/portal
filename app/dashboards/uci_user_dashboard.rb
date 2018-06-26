require "administrate/base_dashboard"

class UciUserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    supervisor: Field::Boolean,
    devices: Field::Number,
    wounds: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    tiss: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :supervisor,
    :devices,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :supervisor,
    :devices,
    :wounds,
    :created_at,
    :updated_at,
    :tiss,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :supervisor,
    :devices,
    :wounds,
    :tiss,
  ].freeze

  # Overwrite this method to customize how uci users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(uci_user)
  #   "UciUser ##{uci_user.id}"
  # end
end
