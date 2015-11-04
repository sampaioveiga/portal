class UserPhoneNumber < ActiveRecord::Base
	belongs_to :user
	
	validates :numero_contacto,
		presence: true,
		numericality: true,
		length: { maximum: 50 }
end