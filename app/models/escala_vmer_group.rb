class EscalaVmerGroup < ActiveRecord::Base
	has_many :escala_vmer_users

	validates :nome_grupo,
		presence: true,
		uniqueness: true
end