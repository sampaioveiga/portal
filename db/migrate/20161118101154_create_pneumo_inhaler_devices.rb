class CreatePneumoInhalerDevices < ActiveRecord::Migration
    def change
        create_table :pneumo_inhaler_devices do |t|
            t.belongs_to :pneumo_devices_category, index: true
            t.string :designacao
            t.string :dci
            t.boolean :ativo, null: false, default: false

            t.timestamps null: false
        end
    end
end
