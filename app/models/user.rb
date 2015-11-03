class User < ActiveRecord::Base
	belongs_to :ulsne_site

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