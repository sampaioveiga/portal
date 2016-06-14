class UciCatheter < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user
	belongs_to :catheter_type

	validates :patient, :user, :catheter_type,
		presence: true
	validates :data_introducao,
		presence: true,
		date: true
	validates :data_remocao,
		date: true,
		date: { after_or_equal_to: :data_introducao },
		allow_nil: true
end