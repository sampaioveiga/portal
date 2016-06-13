class Catheter < ActiveRecord::Base
	has_many :uci_patient_catheters

	validates :nome_cateter,
		presence: true,
		uniqueness: true
end