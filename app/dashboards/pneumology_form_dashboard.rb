require "administrate/base_dashboard"

class PneumologyFormDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    patient: Field::BelongsTo,
    user: Field::BelongsTo,
    pneumo_forms_inhaler_devices: Field::HasMany,
    id: Field::Number,
    data: Field::DateTime,
    peso: Field::String.with_options(searchable: false),
    ta_s: Field::Number,
    ta_d: Field::Number,
    pulso: Field::Number,
    o2: Field::Number,
    inaladores: Field::Boolean,
    tecnica_inalatoria_antes: Field::String,
    tecnica_inalatoria_depois: Field::String,
    observacoes: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    pef: Field::Number,
    o2_note: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :patient,
    :user,
    :pneumo_forms_inhaler_devices,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :patient,
    :user,
    :pneumo_forms_inhaler_devices,
    :id,
    :data,
    :peso,
    :ta_s,
    :ta_d,
    :pulso,
    :o2,
    :inaladores,
    :tecnica_inalatoria_antes,
    :tecnica_inalatoria_depois,
    :observacoes,
    :created_at,
    :updated_at,
    :pef,
    :o2_note,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :patient,
    :user,
    :pneumo_forms_inhaler_devices,
    :data,
    :peso,
    :ta_s,
    :ta_d,
    :pulso,
    :o2,
    :inaladores,
    :tecnica_inalatoria_antes,
    :tecnica_inalatoria_depois,
    :observacoes,
    :pef,
    :o2_note,
  ].freeze

  # Overwrite this method to customize how pneumology forms are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(pneumology_form)
  #   "PneumologyForm ##{pneumology_form.id}"
  # end
end
