class CreateTranspUserTrips < ActiveRecord::Migration
	def change
		create_table :transp_user_trips do |t|
			t.belongs_to :user, index: true
			t.belongs_to :ulsne_department, index: true
			t.string :assunto
			t.integer :numero_passageiros
			t.belongs_to :transp_destination, index: true
			t.datetime :data_inicio
			t.integer :local_inicio_id
			t.datetime :data_fim
			t.integer :local_fim_id
			t.string :condutor
			t.string :observacoes
			t.boolean :supervisor, null: false, default: false
			t.integer :aprovacao
			t.string :comentarios_supervisor

			t.timestamps null: false
		end
	end
end
