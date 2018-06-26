require "administrate/base_dashboard"

class UciWoundDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    patient: Field::BelongsTo,
    user: Field::BelongsTo,
    wound_type: Field::BelongsTo,
    body_part: Field::BelongsTo,
    id: Field::Number,
    data_registo: Field::DateTime,
    origem: Field::String,
    complicacoes: Field::Boolean,
    antibioticos: Field::Boolean,
    observacoes: Field::String,
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
    :wound_type,
    :body_part,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :patient,
    :user,
    :wound_type,
    :body_part,
    :id,
    :data_registo,
    :origem,
    :complicacoes,
    :antibioticos,
    :observacoes,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :patient,
    :user,
    :wound_type,
    :body_part,
    :data_registo,
    :origem,
    :complicacoes,
    :antibioticos,
    :observacoes,
  ].freeze

  # Overwrite this method to customize how uci wounds are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(uci_wound)
  #   "UciWound ##{uci_wound.id}"
  # end
end
