class CreatePneumoUsers < ActiveRecord::Migration
	def change
		create_table :pneumo_users do |t|
			t.references :user, index: true, foreign_key: true
			t.integer :nivel_acesso
			t.boolean :supervisor,  null: false, default: false

			t.timestamps null: false
		end
	end
end
