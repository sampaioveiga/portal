class CreateUciTissValues < ActiveRecord::Migration
	def change
		create_table :uci_tiss_values do |t|
			t.references :patient, index: true
			t.references :user, index: true
			t.date :data
			t.decimal :valor

			t.timestamps null: false
		end
	end
end
