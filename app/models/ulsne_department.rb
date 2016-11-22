class UlsneDepartment < ActiveRecord::Base
	has_many :u2d_associations
	has_many :users, through: :u2d_associations
	has_many :ulsne_sites, through: :users
	has_many :office_phone_numbers
	accepts_nested_attributes_for :office_phone_numbers, reject_if: :all_blank, allow_destroy: true
	has_many :transp_user_trips
	has_many :hig_maos_observations

	validates :nome_servico,
		presence: true,
		length: { maximum: 50 },
		uniqueness: true
end