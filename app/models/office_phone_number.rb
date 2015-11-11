class OfficePhoneNumber < ActiveRecord::Base
	belongs_to :ulsne_department
	belongs_to :ulsne_site

	validates :nome_gabinete,
		presence: true,
		length: { maximum: 50 }
	validates :numero_gabinete,
		numericality: true,
		length: { minimum: 3, maximum: 10 }
end