class CreateUciWounds < ActiveRecord::Migration
	def change
		create_table :uci_wounds do |t|
			t.references :patient, index: true
			t.references :user, index: true
			t.references :wound_type, index: true
			t.references :body_part, index: true
			t.date :data_registo
			t.string :origem
			t.boolean :complicacoes, null: false, default: false
			t.boolean :antibioticos, null: false, default: false
			t.string :observacoes

			t.timestamps null: false
		end
	end
end
