class CreateAjudasTecnicasLoans < ActiveRecord::Migration
	def change
		create_table :ajudas_tecnicas_loans do |t|
			t.string :cuidador
			t.date :inicio_cedencia
			t.date :fim_cedencia
			t.string :observacoes
			t.belongs_to :ajudas_tecnicas_patient, index: true
			t.belongs_to :ajudas_tecnicas_equipment, index: true

			t.timestamps null: false
		end
	end
end
