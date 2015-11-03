class CreateUlsneDepartments < ActiveRecord::Migration
	def change
		create_table :ulsne_departments do |t|
			t.string :nome_servico, unique: true

			t.timestamps null: false
		end
	end
end
