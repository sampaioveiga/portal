class CreateAjudasTecnicasContactTypes < ActiveRecord::Migration
	def change
		create_table :ajudas_tecnicas_contact_types do |t|
			t.string :tipo_contacto, uniq: true			

			t.timestamps null: false
		end
	end
end
