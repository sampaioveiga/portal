class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :nome_utilizador
			t.integer :numero_mecanografico, index: true
			t.string :email, index: true
			t.string :password_digest

			t.timestamps null: false
		end
	end
end
