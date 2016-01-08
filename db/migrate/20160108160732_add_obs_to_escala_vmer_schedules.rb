class AddObsToEscalaVmerSchedules < ActiveRecord::Migration
	def change
		change_table :escala_vmer_schedules do |t|
			t.string :obs
		end
	end
end
