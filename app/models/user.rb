class User < ActiveRecord::Base
	belongs_to :ulsne_site
	has_many :u2d_associations
	accepts_nested_attributes_for :u2d_associations, reject_if: :all_blank, allow_destroy: true
	has_many :ulsne_departments, through: :u2d_associations
	has_many :user_phone_numbers
	accepts_nested_attributes_for :user_phone_numbers, reject_if: :all_blank, allow_destroy: true
	has_one :transp_user

	validates :nome_utilizador,
		presence: true,
		length: { maximum: 50 }
	validates :numero_mecanografico,
		presence: true,
		numericality: true,
		uniqueness: true,
		length: { is: 5 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
		presence: true,
		length: { maximum: 255 },
		uniqueness: { case_sensitive: false },
		format: { with: VALID_EMAIL_REGEX }
end