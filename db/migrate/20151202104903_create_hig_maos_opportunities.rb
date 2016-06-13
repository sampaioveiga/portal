class CreateHigMaosOpportunities < ActiveRecord::Migration
	def change
		create_table :hig_maos_opportunities do |t|
			t.belongs_to :hig_maos_opportunities_cluster, index: { name: 'oppo_cluster'}
			t.boolean :antes_doente, null: false, default: false
			t.boolean :antes_assetico, null: false, default: false
			t.boolean :apos_sangue_fluido, null: false, default: false
			t.boolean :apos_doente, null: false, default: false
			t.boolean :apos_ambiente, null: false, default: false
			t.boolean :friccao_antisetica, null: false, default: false
			t.boolean :lavagem, null: false, default: false
			t.boolean :nao_realizado, null: false, default: false

			t.timestamps null: false
		end
	end
end
