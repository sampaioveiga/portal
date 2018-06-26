require "administrate/base_dashboard"

class TranspUserTripDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    ulsne_department: Field::BelongsTo,
    transp_destination: Field::BelongsTo,
    local_inicio: Field::BelongsTo.with_options(class_name: "UlsneSite"),
    local_fim: Field::BelongsTo.with_options(class_name: "UlsneSite"),
    id: Field::Number,
    assunto: Field::String,
    numero_passageiros: Field::Number,
    data_inicio: Field::DateTime,
    local_inicio_id: Field::Number,
    data_fim: Field::DateTime,
    local_fim_id: Field::Number,
    condutor: Field::String,
    observacoes: Field::String,
    supervisor: Field::Boolean,
    aprovacao: Field::Number,
    comentarios_supervisor: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :transp_destination,
    :local_inicio,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :transp_destination,
    :local_inicio,
    :local_fim,
    :id,
    :assunto,
    :numero_passageiros,
    :data_inicio,
    :local_inicio_id,
    :data_fim,
    :local_fim_id,
    :condutor,
    :observacoes,
    :supervisor,
    :aprovacao,
    :comentarios_supervisor,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :ulsne_department,
    :transp_destination,
    :local_inicio,
    :local_fim,
    :assunto,
    :numero_passageiros,
    :data_inicio,
    :local_inicio_id,
    :data_fim,
    :local_fim_id,
    :condutor,
    :observacoes,
    :supervisor,
    :aprovacao,
    :comentarios_supervisor,
  ].freeze

  # Overwrite this method to customize how transp user trips are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(transp_user_trip)
  #   "TranspUserTrip ##{transp_user_trip.id}"
  # end
end
