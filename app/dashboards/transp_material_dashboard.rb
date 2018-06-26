require "administrate/base_dashboard"

class TranspMaterialDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    ulsne_department: Field::BelongsTo,
    local_saida: Field::BelongsTo.with_options(class_name: "TranspDestination"),
    local_entrega: Field::BelongsTo.with_options(class_name: "TranspDestination"),
    id: Field::Number,
    assunto: Field::String,
    local_saida_id: Field::Number,
    local_entrega_id: Field::Number,
    data_entrega: Field::DateTime,
    observacoes: Field::String,
    supervisor: Field::Boolean,
    aprovacao: Field::Number,
    comentarios_supervisor: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    urgente: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :local_saida,
    :local_entrega,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :local_saida,
    :local_entrega,
    :id,
    :assunto,
    :local_saida_id,
    :local_entrega_id,
    :data_entrega,
    :observacoes,
    :supervisor,
    :aprovacao,
    :comentarios_supervisor,
    :created_at,
    :updated_at,
    :urgente,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :local_saida,
    :local_entrega,
    :assunto,
    :local_saida_id,
    :local_entrega_id,
    :data_entrega,
    :observacoes,
    :supervisor,
    :aprovacao,
    :comentarios_supervisor,
    :urgente,
  ].freeze

  # Overwrite this method to customize how transp materials are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(transp_material)
  #   "TranspMaterial ##{transp_material.id}"
  # end
end
