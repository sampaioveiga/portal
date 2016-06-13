class CreateUciPatientCatheters < ActiveRecord::Migration
	def change
		create_table :uci_patient_catheters do |t|
			t.belongs_to :patient, index: true
			t.belongs_to :user, index: true
			t.belongs_to :catheter, index: true
			t.date :data_introducao
			t.date :data_remocao
			t.string :observacao

			t.timestamps null: false
		end
	end
end
