class UciWound < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user
	belongs_to :wound_type
	belongs_to :body_part

	validates :patient_id, :body_part_id, :wound_type_id,
		presence: true
	validates :data_registo,
		presence: true,
		date: true
end