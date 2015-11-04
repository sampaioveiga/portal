class CreateU2dAssociations < ActiveRecord::Migration
	def change
		create_table :u2d_associations do |t|
			t.belongs_to :user, index: true
			t.belongs_to :ulsne_department, index: true

			t.timestamps null: false
		end
	end
end
