require "administrate/base_dashboard"

class AjudasTecnicasEquipmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    loans: Field::HasMany,
    id: Field::Number,
    equipamento: Field::String,
    inventario: Field::Number,
    descricao: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :loans,
    :id,
    :equipamento,
    :inventario,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :loans,
    :id,
    :equipamento,
    :inventario,
    :descricao,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :loans,
    :equipamento,
    :inventario,
    :descricao,
  ].freeze

  # Overwrite this method to customize how ajudas tecnicas equipments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ajudas_tecnicas_equipment)
  #   "AjudasTecnicasEquipment ##{ajudas_tecnicas_equipment.id}"
  # end
end
