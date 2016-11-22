class Patient < ActiveRecord::Base
	has_many :uci_devices
	has_many :uci_wounds
	has_many :uci_tiss_values
	has_many :pneumology_forms

	validates :nome,
		presence: true
	validates :data_nascimento,
		presence: true,
		date: true
	validates :rnu, :numero_processo_sonho,
		presence: true,
		uniqueness: true
	validates :nif,
		uniqueness: true
end