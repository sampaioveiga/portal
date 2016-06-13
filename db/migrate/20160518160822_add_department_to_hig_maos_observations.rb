class AddDepartmentToHigMaosObservations < ActiveRecord::Migration
	def change
		change_table :hig_maos_observations do |t|
			t.belongs_to :ulsne_department, index: true
		end
	end
end
