class CreateAjudasTecnicasPatients < ActiveRecord::Migration
	def change
		create_table :ajudas_tecnicas_patients do |t|
			t.string :nome_doente
			t.date :ddn
			t.integer :rnu, index: true
			t.string :sexo
			t.string :morada
			t.integer :cpostal
			t.integer :cpostal2
			t.string :localidade
			t.boolean :obito, null: false, default: false
			t.belongs_to :ajudas_tecnicas_physician, index: true

			t.timestamps null: false
		end
	end
end
