class AddTissAuthorisationToUciUsers < ActiveRecord::Migration
	def change
		add_column :uci_users, :tiss, :integer
	end
end
