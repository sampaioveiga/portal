class CatheterType < ActiveRecord::Base
	has_many :uci_catheters

	validates :nome_cateter,
		presence: true,
		uniqueness: true
end