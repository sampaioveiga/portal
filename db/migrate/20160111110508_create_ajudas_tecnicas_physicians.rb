class CreateAjudasTecnicasPhysicians < ActiveRecord::Migration
	def change
		create_table :ajudas_tecnicas_physicians do |t|
			t.string :nome_medico, uniq: true

			t.timestamps null: false
		end
	end
end
