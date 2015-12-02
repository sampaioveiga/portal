class CreateHigMaosWorkerCategories < ActiveRecord::Migration
	def change
		create_table :hig_maos_worker_categories do |t|
			t.string :categoria_profissional, unique: true

			t.timestamps null: false
		end
	end
end
