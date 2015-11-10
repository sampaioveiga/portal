class CreateOfficePhoneNumbers < ActiveRecord::Migration
	def change
		create_table :office_phone_numbers do |t|
			t.string :nome_gabinete
			t.integer :numero_gabinete
			t.belongs_to :ulsne_site, index: true
			t.belongs_to :ulsne_department, index: true

			t.timestamps null: false
		end
	end
end
