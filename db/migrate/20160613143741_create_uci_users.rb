class CreateUciUsers < ActiveRecord::Migration
	def change
		create_table :uci_users do |t|
			t.references :user, index: true
			t.boolean :supervisor, null: false, default: false
			t.integer :wounds
			t.integer :catheters

			t.timestamps null: false
		end
	end
end
