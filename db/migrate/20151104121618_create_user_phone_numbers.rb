class CreateUserPhoneNumbers < ActiveRecord::Migration
	def change
		create_table :user_phone_numbers do |t|
			t.integer :numero_contacto
			t.belongs_to :user, index: true

			t.timestamps null: false
		end
	end
end
