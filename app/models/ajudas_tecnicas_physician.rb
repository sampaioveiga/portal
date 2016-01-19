class AjudasTecnicasPhysician < ActiveRecord::Base
	validates :nome_medico,
		presence: true,
		uniqueness: true
end