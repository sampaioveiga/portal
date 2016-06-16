class CreateUciDevices < ActiveRecord::Migration
	def change
		create_table :uci_devices do |t|
			t.belongs_to :patient, index: true
			t.belongs_to :user, index: true
			t.belongs_to :device_type, index: true
			t.date :data_introducao
			t.date :data_remocao
			t.string :observacao

			t.timestamps null: false
		end
	end
end
