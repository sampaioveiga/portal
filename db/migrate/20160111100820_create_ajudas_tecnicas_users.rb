class CreateAjudasTecnicasUsers < ActiveRecord::Migration
	def change
		create_table :ajudas_tecnicas_users do |t|
			t.belongs_to :user, index: true
			t.integer :nivel_acesso

			t.timestamps null: false
		end
	end
end
