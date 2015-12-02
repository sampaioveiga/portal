class CreateHigMaosOpportunities < ActiveRecord::Migration
	def change
		create_table :hig_maos_opportunities do |t|
			t.belongs_to :hig_maos_opportunities_cluster, index: { name: 'oppo_cluster'}
			t.boolean :antes_doente, default: false
			t.boolean :antes_assetico, default: false
			t.boolean :apos_sangue_fluido, default: false
			t.boolean :apos_doente, default: false
			t.boolean :apos_ambiente, default: false
			t.boolean :friccao_antisetica, default: false
			t.boolean :lavagem, default: false
			t.boolean :nao_realizado, default: false

			t.timestamps null: false
		end
	end
end
