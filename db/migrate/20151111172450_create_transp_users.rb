class CreateTranspUsers < ActiveRecord::Migration
	def change
		create_table :transp_users do |t|
			t.belongs_to :user, index: true
			t.integer :nivel_acesso

			t.timestamps null: false
		end
	end
end
