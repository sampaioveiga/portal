class PneumologyForm < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user

	validates :data,
		date: true
	validates :user_id, :patient_id,
		presence: true
	validates :peso, :ta_s, :ta_d, :pulso, :o2,
		numericality: { allow_nil: true }
end