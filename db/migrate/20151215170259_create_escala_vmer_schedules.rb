class CreateEscalaVmerSchedules < ActiveRecord::Migration
  	def change
		create_table :escala_vmer_schedules do |t|
			t.belongs_to :user, index: true
			t.datetime :inicio_turno
			t.integer :tipo_turno
			t.datetime :fim_turno
			t.boolean :escalado, null: false, default: false

			t.timestamps null: false
		end
	end
end
