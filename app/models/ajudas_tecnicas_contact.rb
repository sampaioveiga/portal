class AjudasTecnicasContact < ActiveRecord::Base
	belongs_to :ajudas_tecnicas_patient
	belongs_to :ajudas_tecnicas_contact_type

	validates :contacto,
		presence: true
end