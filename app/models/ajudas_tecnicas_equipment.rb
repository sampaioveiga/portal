class AjudasTecnicasEquipment < ActiveRecord::Base
	has_many :loans

	validates :equipamento,
		presence: true
	validates :inventario,
		uniqueness: { allow_blank: true }
end