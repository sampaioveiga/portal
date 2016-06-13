class CreateCatheters < ActiveRecord::Migration
	def change
		create_table :catheters do |t|
			t.string :nome_cateter, index: true

			t.timestamps null: false
		end
	end
end