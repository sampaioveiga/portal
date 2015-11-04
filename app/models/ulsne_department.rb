class UlsneDepartment < ActiveRecord::Base
	has_many :u2d_associations
	has_many :users, through: :u2d_associations

	validates :nome_servico,
		presence: true,
		length: { maximum: 50 },
		uniqueness: true
end