class ContactListsController < ApplicationController
	def people
		@contacts = User.order(:nome_utilizador)
		@contacts_by_first_letter = @contacts.group_by { |a| a.nome_utilizador[0].downcase }
	end

	def person
		@person = User.find(params[:id])
	end

	def people_departments
		@departments = UlsneDepartment.order(:nome_servico)
	end

	def people_department
		@department = UlsneDepartment.find(params[:id])
	end
end