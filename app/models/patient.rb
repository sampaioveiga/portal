class Patient < ActiveRecord::Base
	has_many :uci_catheters

	validates :nome,
		presence: true
	validates :data_nascimento,
		presence: true,
		date: true
	validates :rnu, :nif, :numero_processo_sonho,
		presence: true,
		uniqueness: true,
		allow_nil: true
end