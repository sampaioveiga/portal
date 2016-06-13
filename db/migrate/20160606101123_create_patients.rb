class CreatePatients < ActiveRecord::Migration
	def change
		create_table :patients do |t|
			t.string :nome
			t.date :data_nascimento
			t.integer :rnu, index: true
			t.integer :nif, index: true
			t.integer :numero_processo_sonho, index: true

			t.timestamps null: false
		end
	end
end
