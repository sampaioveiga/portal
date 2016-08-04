class CreatePneumologyForms < ActiveRecord::Migration
	def change
		create_table :pneumology_forms do |t|
			t.references :user, index: true, foreign_key: true
			t.references :patient, index: true, foreign_key: true
			t.date :data
			t.decimal :peso
			t.integer :ta_s
			t.integer :ta_d
			t.integer :pulso
			t.integer :o2
			t.boolean :inaladores, default: false, null: false
			t.string :tecnica_inalatoria_antes
			t.string :tecnica_inalatoria_depois
			t.string :observacoes


			t.timestamps null: false
		end
	end
end
