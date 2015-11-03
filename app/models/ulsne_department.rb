class UlsneDepartment < ActiveRecord::Base
	validates :nome_servico,
		presence: true,
		length: { maximum: 50 },
		uniqueness: true
end