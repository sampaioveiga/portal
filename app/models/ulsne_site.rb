class UlsneSite < ActiveRecord::Base
		validates :nome_unidade,
		presence: true,
		length: { maximum: 50 },
		uniqueness: true
end