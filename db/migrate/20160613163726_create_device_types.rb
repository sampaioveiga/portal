class CreateDeviceTypes < ActiveRecord::Migration
	def change
		create_table :device_types do |t|
			t.string :nome_dispositivo, index: true

			t.timestamps null: false
		end
	end
end
