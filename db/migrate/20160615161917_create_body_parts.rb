class CreateBodyParts < ActiveRecord::Migration
	def change
		create_table :body_parts do |t|
			t.string :parte_do_corpo, index: true

			t.timestamps null: false
		end
	end
end
