class AjudasTecnicasLoan < ActiveRecord::Base
	belongs_to :ajudas_tecnicas_patient
	belongs_to :ajudas_tecnicas_equipment

	validates :inicio_cedencia, :ajudas_tecnicas_equipment_id,
		presence: true
	validates :fim_cedencia,
		date: { after: :inicio_cedencia },
		on: :update

	scope :active, -> { where(fim_cedencia: nil) }
end