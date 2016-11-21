class PneumologyForm < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user
    has_many :pneumo_forms_inhaler_devices
    accepts_nested_attributes_for :pneumo_forms_inhaler_devices, reject_if: :all_blank, allow_destroy: true

	validates :data,
		date: true
	validates :user_id, :patient_id,
		presence: true
	validates :peso, :ta_s, :ta_d, :pulso, :o2,
		numericality: { allow_nil: true }
end