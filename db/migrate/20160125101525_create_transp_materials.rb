class CreateTranspMaterials < ActiveRecord::Migration
	def change
		create_table :transp_materials do |t|
			t.belongs_to :user, index: true
			t.belongs_to :ulsne_department, index: true
			t.string :assunto
			t.integer :local_saida_id, index: true
			t.integer :local_entrega_id, index: true
			t.datetime :data_entrega
			t.boolean :urgente, null: false, default: false
			t.string :observacoes
			t.boolean :supervisor, null: false, default: false
			t.integer :aprovacao
			t.string :comentarios_supervisor

			t.timestamps null: false
		end
	end
end
