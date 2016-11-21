class AddPefToPneumoForms < ActiveRecord::Migration
	def change
		change_table :pneumology_forms do |t|
			t.integer :pef
		end
	end
end
