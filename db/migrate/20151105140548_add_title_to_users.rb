class AddTitleToUsers < ActiveRecord::Migration
	def change
		change_table :users do |t|
			t.string :titulo
		end
	end
end
