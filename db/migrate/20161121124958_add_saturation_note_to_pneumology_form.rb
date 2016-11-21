class AddSaturationNoteToPneumologyForm < ActiveRecord::Migration
    def change
        change_table :pneumology_forms do |t|
            t.string :o2_note
        end
    end
end
