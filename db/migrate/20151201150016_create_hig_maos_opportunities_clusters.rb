class CreateHigMaosOpportunitiesClusters < ActiveRecord::Migration
	def change
		create_table :hig_maos_opportunities_clusters do |t|
			t.belongs_to :hig_maos_observation, index: { name: 'observation'}
			t.integer :numero_profissionais
			t.belongs_to :hig_maos_worker_category, index: { name: 'category' }

			t.timestamps null: false
		end
	end
end
