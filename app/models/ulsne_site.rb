class UlsneSite < ActiveRecord::Base
	has_many :users
	has_many :office_phone_numbers
	has_many :ulsne_departments, through: :office_phone_numbers
	has_many :hig_maos_observations
	
	validates :nome_unidade,
		presence: true,
		length: { maximum: 50 },
		uniqueness: true
end