class UsersToSite < ActiveRecord::Migration
	def change
		change_table :users do |t|
			t.belongs_to :ulsne_site, index: true
		end
	end
end
