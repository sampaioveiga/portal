class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :nome_utilizador
			t.integer :numero_mecanografico, unique: true
			t.string :email, unique: true

			t.timestamps null: false
		end
	end
end
