require "administrate/base_dashboard"

class HigMaosOpportunitiesClusterDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    hig_maos_observation: Field::BelongsTo,
    hig_maos_worker_category: Field::BelongsTo,
    hig_maos_opportunities: Field::HasMany,
    id: Field::Number,
    numero_profissionais: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :hig_maos_observation,
    :hig_maos_worker_category,
    :hig_maos_opportunities,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :hig_maos_observation,
    :hig_maos_worker_category,
    :hig_maos_opportunities,
    :id,
    :numero_profissionais,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :hig_maos_observation,
    :hig_maos_worker_category,
    :hig_maos_opportunities,
    :numero_profissionais,
  ].freeze

  # Overwrite this method to customize how hig maos opportunities clusters are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(hig_maos_opportunities_cluster)
  #   "HigMaosOpportunitiesCluster ##{hig_maos_opportunities_cluster.id}"
  # end
end
