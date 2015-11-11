class ContactListsController < ApplicationController
	before_action :load_units

	def people
		@contacts = User.order(:nome_utilizador)
		@contacts_by_first_letter = @contacts.group_by { |a| a.nome_utilizador[0].downcase }
	end

	def person
		@person = User.find(params[:id])
	end

	def unit
		@unit = UlsneSite.find(params[:id])
		@departments = @unit.ulsne_departments.group(:nome_servico)		
		#departments = UlsneDepartment.all
		#departments = office_phone_numbers.where("ulsne_site = ?", @unit)
		#@office_phone_numbers = OfficePhoneNumber.all
	end

	def department_unit
		@unit = UlsneSite.find(params[:unit_id])
		@department = @unit.ulsne_departments.find(params[:id])
		@users = @department.users.where("ulsne_site_id = ?", params[:unit_id])
		@offices = @department.office_phone_numbers.where("ulsne_site_id = ?", params[:unit_id])
	end

	private

	def load_units
		@units = UlsneSite.order(:nome_unidade)
	end
end