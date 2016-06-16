class CreateWoundTypes < ActiveRecord::Migration
	def change
		create_table :wound_types do |t|
			t.string :ferida, index: true

			t.timestamps null: false
		end
	end
end
