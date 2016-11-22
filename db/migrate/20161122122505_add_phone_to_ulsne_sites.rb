class AddPhoneToUlsneSites < ActiveRecord::Migration
    def change
        change_table :ulsne_sites do |t|
            t.integer :telefone
        end
    end
end
