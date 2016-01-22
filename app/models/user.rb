class User < ActiveRecord::Base
	has_secure_password
	belongs_to :ulsne_site
	has_many :u2d_associations
	accepts_nested_attributes_for :u2d_associations, reject_if: :all_blank, allow_destroy: true
	has_many :ulsne_departments, through: :u2d_associations
	has_many :user_phone_numbers
	accepts_nested_attributes_for :user_phone_numbers, reject_if: :all_blank, allow_destroy: true
	has_one :transp_user
	has_many :transp_user_trips, dependent: :destroy
	has_one :satisf_surv_user
	has_many :satisf_surv_surveys, dependent: :destroy
	has_one :hig_maos_user
	has_many :hig_maos_observations, dependent: :destroy
	has_one :escala_vmer_user
	has_many :escala_vmer_schedules, dependent: :destroy
	has_one :ajudas_tecnicas_user

	validates :nome_utilizador,
		presence: true,
		length: { maximum: 50 }
	validates :numero_mecanografico,
		presence: true,
		numericality: true,
		uniqueness: true,
		length: { is: 5 }
	validates_presence_of :user_phone_numbers,
		{ message: ' tem de introduzir pelo menos um contacto' } 
	validates_presence_of :u2d_associations,
		{ message: ' tem de escolher pelo menos um serviço' } 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
		presence: true,
		length: { maximum: 255 },
		uniqueness: { case_sensitive: false },
		format: { with: VALID_EMAIL_REGEX }
	validates :password,
		presence: true,
		length: { minimum: 6 },
		on: :create
end