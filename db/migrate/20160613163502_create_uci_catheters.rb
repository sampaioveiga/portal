class CreateUciCatheters < ActiveRecord::Migration
	def change
		create_table :uci_catheters do |t|
			t.belongs_to :patient, index: true
			t.belongs_to :user, index: true
			t.belongs_to :catheter_type, index: true
			t.date :data_introducao
			t.date :data_remocao
			t.string :observacao

			t.timestamps null: false
		end
	end
end
