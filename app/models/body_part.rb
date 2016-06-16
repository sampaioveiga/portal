class BodyPart < ActiveRecord::Base
	has_many :uci_wounds

	validates :parte_do_corpo,
		presence: true,
		uniqueness: true
end