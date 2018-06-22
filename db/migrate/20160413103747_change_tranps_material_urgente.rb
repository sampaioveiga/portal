class ChangeTranpsMaterialUrgente < ActiveRecord::Migration
	def change
		rename_column :transp_materials, :urgente, :urgente_boolean
		add_column :transp_materials, :urgente, :integer
		#execute "UPDATE transp_materials SET urgente = 1 WHERE urgente_boolean = true"
		remove_column :transp_materials, :urgente_boolean, :boolean
	end
end
