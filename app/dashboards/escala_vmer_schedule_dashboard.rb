require "administrate/base_dashboard"

class EscalaVmerScheduleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    inicio_turno: Field::DateTime,
    tipo_turno: Field::Number,
    fim_turno: Field::DateTime,
    escalado: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    obs: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :inicio_turno,
    :tipo_turno,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :inicio_turno,
    :tipo_turno,
    :fim_turno,
    :escalado,
    :created_at,
    :updated_at,
    :obs,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :inicio_turno,
    :tipo_turno,
    :fim_turno,
    :escalado,
    :obs,
  ].freeze

  # Overwrite this method to customize how escala vmer schedules are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(escala_vmer_schedule)
  #   "EscalaVmerSchedule ##{escala_vmer_schedule.id}"
  # end
end
