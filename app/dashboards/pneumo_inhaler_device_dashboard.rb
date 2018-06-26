require "administrate/base_dashboard"

class PneumoInhalerDeviceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    pneumo_devices_category: Field::BelongsTo,
    pneumo_forms_inhaler_devices: Field::HasMany,
    id: Field::Number,
    designacao: Field::String,
    dci: Field::String,
    ativo: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :pneumo_devices_category,
    :pneumo_forms_inhaler_devices,
    :id,
    :designacao,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :pneumo_devices_category,
    :pneumo_forms_inhaler_devices,
    :id,
    :designacao,
    :dci,
    :ativo,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :pneumo_devices_category,
    :pneumo_forms_inhaler_devices,
    :designacao,
    :dci,
    :ativo,
  ].freeze

  # Overwrite this method to customize how pneumo inhaler devices are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(pneumo_inhaler_device)
  #   "PneumoInhalerDevice ##{pneumo_inhaler_device.id}"
  # end
end
