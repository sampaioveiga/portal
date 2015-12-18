class CreateEscalaVmerUsers < ActiveRecord::Migration
	def change
		create_table :escala_vmer_users do |t|
			t.belongs_to :user, index: true
			t.belongs_to :escala_vmer_group, index: true
			t.integer :nivel_acesso

			t.timestamps null: false
		end
	end
end
