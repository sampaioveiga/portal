require "administrate/base_dashboard"

class HigMaosObservationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    ulsne_site: Field::BelongsTo,
    ulsne_department: Field::BelongsTo,
    hig_maos_opportunities_clusters: Field::HasMany,
    hig_maos_opportunities: Field::HasMany,
    id: Field::Number,
    inicio_sessao: Field::DateTime,
    fim_sessao: Field::DateTime,
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
    :ulsne_site,
    :ulsne_department,
    :hig_maos_opportunities_clusters,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :ulsne_site,
    :ulsne_department,
    :hig_maos_opportunities_clusters,
    :hig_maos_opportunities,
    :id,
    :inicio_sessao,
    :fim_sessao,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :ulsne_site,
    :ulsne_department,
    :hig_maos_opportunities_clusters,
    :hig_maos_opportunities,
    :inicio_sessao,
    :fim_sessao,
  ].freeze

  # Overwrite this method to customize how hig maos observations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(hig_maos_observation)
  #   "HigMaosObservation ##{hig_maos_observation.id}"
  # end
end
