require "administrate/base_dashboard"

class UciTissValueDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    patient: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    data: Field::DateTime,
    valor: Field::String.with_options(searchable: false),
    b1_q1: Field::String.with_options(searchable: false),
    b1_q2: Field::String.with_options(searchable: false),
    b1_q3: Field::String.with_options(searchable: false),
    b1_q4: Field::String.with_options(searchable: false),
    b1_q5: Field::String.with_options(searchable: false),
    b1_q6: Field::String.with_options(searchable: false),
    b1_q7: Field::String.with_options(searchable: false),
    b2_q1: Field::String.with_options(searchable: false),
    b2_q2: Field::String.with_options(searchable: false),
    b2_q3: Field::String.with_options(searchable: false),
    b2_q4: Field::String.with_options(searchable: false),
    b3_q1: Field::String.with_options(searchable: false),
    b3_q2: Field::String.with_options(searchable: false),
    b3_q3: Field::String.with_options(searchable: false),
    b3_q4: Field::String.with_options(searchable: false),
    b3_q5: Field::String.with_options(searchable: false),
    b3_q6: Field::String.with_options(searchable: false),
    b3_q7: Field::String.with_options(searchable: false),
    b4_q1: Field::String.with_options(searchable: false),
    b4_q2: Field::String.with_options(searchable: false),
    b4_q3: Field::String.with_options(searchable: false),
    b5_q1: Field::String.with_options(searchable: false),
    b6_q1: Field::String.with_options(searchable: false),
    b6_q2: Field::String.with_options(searchable: false),
    b6_q3: Field::String.with_options(searchable: false),
    b7_q1: Field::String.with_options(searchable: false),
    b7_q2: Field::String.with_options(searchable: false),
    b7_q3: Field::String.with_options(searchable: false),
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
    :id,
    :data,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :patient,
    :user,
    :id,
    :data,
    :valor,
    :b1_q1,
    :b1_q2,
    :b1_q3,
    :b1_q4,
    :b1_q5,
    :b1_q6,
    :b1_q7,
    :b2_q1,
    :b2_q2,
    :b2_q3,
    :b2_q4,
    :b3_q1,
    :b3_q2,
    :b3_q3,
    :b3_q4,
    :b3_q5,
    :b3_q6,
    :b3_q7,
    :b4_q1,
    :b4_q2,
    :b4_q3,
    :b5_q1,
    :b6_q1,
    :b6_q2,
    :b6_q3,
    :b7_q1,
    :b7_q2,
    :b7_q3,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :patient,
    :user,
    :data,
    :valor,
    :b1_q1,
    :b1_q2,
    :b1_q3,
    :b1_q4,
    :b1_q5,
    :b1_q6,
    :b1_q7,
    :b2_q1,
    :b2_q2,
    :b2_q3,
    :b2_q4,
    :b3_q1,
    :b3_q2,
    :b3_q3,
    :b3_q4,
    :b3_q5,
    :b3_q6,
    :b3_q7,
    :b4_q1,
    :b4_q2,
    :b4_q3,
    :b5_q1,
    :b6_q1,
    :b6_q2,
    :b6_q3,
    :b7_q1,
    :b7_q2,
    :b7_q3,
  ].freeze

  # Overwrite this method to customize how uci tiss values are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(uci_tiss_value)
  #   "UciTissValue ##{uci_tiss_value.id}"
  # end
end
