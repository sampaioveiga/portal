class CreateAjudasTecnicasEquipments < ActiveRecord::Migration
	def change
		create_table :ajudas_tecnicas_equipments do |t|
			t.string :equipamento
			t.integer :inventario, uniq: true
			t.string :descricao

			t.timestamps null: false
		end
	end
end
