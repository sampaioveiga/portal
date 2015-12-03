class CreateHigMaosObservations < ActiveRecord::Migration
	def change
		create_table :hig_maos_observations do |t|
			t.datetime :inicio_sessao
			t.datetime :fim_sessao
			t.belongs_to :ulsne_site, index: true
			t.belongs_to :user, index: true

			t.timestamps null: false
		end
	end
end
