class CreateUlsneSites < ActiveRecord::Migration
	def change
		create_table :ulsne_sites do |t|
			t.string :nome_unidade, unique: true

			t.timestamps null: false
		end
	end
end
