class UlsneSite < ActiveRecord::Base
	has_many :users
	
	validates :nome_unidade,
		presence: true,
		length: { maximum: 50 },
		uniqueness: true
end