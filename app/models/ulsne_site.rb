class UlsneSite < ActiveRecord::Base
	has_many :users
	has_many :ulsne_departments, through: :users
	has_many :office_phone_numbers
	
	validates :nome_unidade,
		presence: true,
		length: { maximum: 50 },
		uniqueness: true
end