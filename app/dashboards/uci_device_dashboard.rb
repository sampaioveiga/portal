require "administrate/base_dashboard"

class UciDeviceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    patient: Field::BelongsTo,
    user: Field::BelongsTo,
    device_type: Field::BelongsTo,
    id: Field::Number,
    data_introducao: Field::DateTime,
    data_remocao: Field::DateTime,
    observacao: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :patient,
    :user,
    :device_type,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :patient,
    :user,
    :device_type,
    :id,
    :data_introducao,
    :data_remocao,
    :observacao,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :patient,
    :user,
    :device_type,
    :data_introducao,
    :data_remocao,
    :observacao,
  ].freeze

  # Overwrite this method to customize how uci devices are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(uci_device)
  #   "UciDevice ##{uci_device.id}"
  # end
end
