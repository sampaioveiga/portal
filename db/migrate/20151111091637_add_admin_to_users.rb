class AddAdminToUsers < ActiveRecord::Migration
	def change
		change_table :users do |t|
			t.boolean :administrator, null: false, default: false
		end
	end
end
