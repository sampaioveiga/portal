class OfficePhoneNumber < ActiveRecord::Base
	belongs_to :ulsne_departments
	belongs_to :ulsne_sites

	validates :nome_gabinete,
		presence: true,
		length: { maximum: 50 }
	validates :numero_gabinete,
		numericality: true,
		length: { minimum: 3, maximum: 10 }
end