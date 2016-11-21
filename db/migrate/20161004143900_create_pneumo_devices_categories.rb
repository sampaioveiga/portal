class CreatePneumoDevicesCategories < ActiveRecord::Migration
	def change
		create_table :pneumo_devices_categories do |t|
			t.string :categoria, index: true, unique: true
			
			t.timestamps null: false
		end
	end
end
