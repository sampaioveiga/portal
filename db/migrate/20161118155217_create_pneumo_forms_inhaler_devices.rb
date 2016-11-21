class CreatePneumoFormsInhalerDevices < ActiveRecord::Migration
    def change
        create_table :pneumo_forms_inhaler_devices do |t|
            t.belongs_to :pneumo_inhaler_device, index: true
            t.belongs_to :pneumology_form, index: true
            t.string :observacao

            t.timestamps null: false
        end
    end
end
