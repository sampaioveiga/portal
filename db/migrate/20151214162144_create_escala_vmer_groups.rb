class CreateEscalaVmerGroups < ActiveRecord::Migration
	def change
		create_table :escala_vmer_groups do |t|
			t.string :nome_grupo, index: true

			t.timestamps null: false
		end
	end
end
