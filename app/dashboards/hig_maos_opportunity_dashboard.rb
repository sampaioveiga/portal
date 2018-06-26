require "administrate/base_dashboard"

class HigMaosOpportunityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hig_maos_opportunities_cluster: Field::BelongsTo,
    id: Field::Number,
    antes_doente: Field::Boolean,
    antes_assetico: Field::Boolean,
    apos_sangue_fluido: Field::Boolean,
    apos_doente: Field::Boolean,
    apos_ambiente: Field::Boolean,
    friccao_antisetica: Field::Boolean,
    lavagem: Field::Boolean,
    nao_realizado: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :hig_maos_opportunities_cluster,
    :id,
    :antes_doente,
    :antes_assetico,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :hig_maos_opportunities_cluster,
    :id,
    :antes_doente,
    :antes_assetico,
    :apos_sangue_fluido,
    :apos_doente,
    :apos_ambiente,
    :friccao_antisetica,
    :lavagem,
    :nao_realizado,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :hig_maos_opportunities_cluster,
    :antes_doente,
    :antes_assetico,
    :apos_sangue_fluido,
    :apos_doente,
    :apos_ambiente,
    :friccao_antisetica,
    :lavagem,
    :nao_realizado,
  ].freeze

  # Overwrite this method to customize how hig maos opportunities are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(hig_maos_opportunity)
  #   "HigMaosOpportunity ##{hig_maos_opportunity.id}"
  # end
end
