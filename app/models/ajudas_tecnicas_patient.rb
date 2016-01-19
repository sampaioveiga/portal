class AjudasTecnicasPatient < ActiveRecord::Base
	belongs_to :ajudas_tecnicas_physician
	has_many :ajudas_tecnicas_contacts, dependent: :destroy
	accepts_nested_attributes_for :ajudas_tecnicas_contacts, reject_if: :all_blank, allow_destroy: true
	has_many :ajudas_tecnicas_loans

	validates :nome_doente, :ddn, :rnu,
		presence: true
	validates :rnu,
		uniqueness: true
	validates :rnu, :cpostal,
		numericality: true
	validates :cpostal,
		length: { is: 4 }
end