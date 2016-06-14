class CreateCatheterTypes < ActiveRecord::Migration
	def change
		create_table :catheter_types do |t|
			t.string :nome_cateter, index: true

			t.timestamps null: false
		end
	end
end
