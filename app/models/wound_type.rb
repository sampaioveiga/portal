class WoundType < ActiveRecord::Base
	has_many :uci_wounds

	validates :ferida,
		presence: true,
		uniqueness: true
end