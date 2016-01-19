class AjudasTecnicasContactType < ActiveRecord::Base
	has_many :ajudas_tecnicas_contacts

	validates :tipo_contacto,
		presence: true,
		uniqueness: true
end