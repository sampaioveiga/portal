class CreateTranspDestinations < ActiveRecord::Migration
	def change
		create_table :transp_destinations do |t|
			t.string :destino, index: true

			t.timestamps null: false
		end
	end
end
