class UciTissValue < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user

	validates :user_id,
		presence: true
	validates :data,
		presence: true,
		date: true
	validates :valor,
		presence: true,
		numericality: true
end