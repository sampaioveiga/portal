class CreateAjudasTecnicasContacts < ActiveRecord::Migration
	def change
		create_table :ajudas_tecnicas_contacts do |t|
			t.string :contacto
			t.belongs_to :ajudas_tecnicas_patient, index: true
			t.belongs_to :ajudas_tecnicas_contact_type, index: { name: 'contact_type'}

			t.timestamps null: false
		end
	end
end
