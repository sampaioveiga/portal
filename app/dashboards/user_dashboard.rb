require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    ulsne_site: Field::BelongsTo,
    u2d_associations: Field::HasMany,
    ulsne_departments: Field::HasMany,
    user_phone_numbers: Field::HasMany,
    transp_user: Field::HasOne,
    transp_user_trips: Field::HasMany,
    transp_materials: Field::HasMany,
    satisf_surv_user: Field::HasOne,
    satisf_surv_surveys: Field::HasMany,
    hig_maos_user: Field::HasOne,
    hig_maos_observations: Field::HasMany,
    escala_vmer_user: Field::HasOne,
    escala_vmer_schedules: Field::HasMany,
    ajudas_tecnicas_user: Field::HasOne,
    uci_user: Field::HasOne,
    pneumo_user: Field::HasOne,
    id: Field::Number,
    nome_utilizador: Field::String,
    numero_mecanografico: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    titulo: Field::String,
    administrator: Field::Boolean,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    unconfirmed_email: Field::String,
    failed_attempts: Field::Number,
    unlock_token: Field::String,
    locked_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :ulsne_site,
    :u2d_associations,
    :ulsne_departments,
    :user_phone_numbers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :ulsne_site,
    :u2d_associations,
    :ulsne_departments,
    :user_phone_numbers,
    :transp_user,
    :transp_user_trips,
    :transp_materials,
    :satisf_surv_user,
    :satisf_surv_surveys,
    :hig_maos_user,
    :hig_maos_observations,
    :escala_vmer_user,
    :escala_vmer_schedules,
    :ajudas_tecnicas_user,
    :uci_user,
    :pneumo_user,
    :id,
    :nome_utilizador,
    :numero_mecanografico,
    :email,
    :encrypted_password,
    :created_at,
    :updated_at,
    :titulo,
    :administrator,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    :unconfirmed_email,
    :failed_attempts,
    :unlock_token,
    :locked_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ulsne_site,
    :u2d_associations,
    :ulsne_departments,
    :user_phone_numbers,
    :transp_user,
    :transp_user_trips,
    :transp_materials,
    :satisf_surv_user,
    :satisf_surv_surveys,
    :hig_maos_user,
    :hig_maos_observations,
    :escala_vmer_user,
    :escala_vmer_schedules,
    :ajudas_tecnicas_user,
    :uci_user,
    :pneumo_user,
    :nome_utilizador,
    :numero_mecanografico,
    :email,
    :encrypted_password,
    :titulo,
    :administrator,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
    :unconfirmed_email,
    :failed_attempts,
    :unlock_token,
    :locked_at,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
