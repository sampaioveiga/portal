class ContactListsController < ApplicationController
	before_action :load_units

	def people
		@contacts = User.includes(:ulsne_departments).order(:nome_utilizador)
		@contacts_by_first_letter = @contacts.group_by { |a| a.nome_utilizador[0].downcase }
	end

	def person
		@person = User.includes(:ulsne_site, :ulsne_departments, :user_phone_numbers).find(params[:id])
	end

	def unit
		@unit = UlsneSite.find(params[:id])

		# depart with people
		@departments = @unit.ulsne_departments.group(:nome_servico)		
		
		# tests
		#@phones = OfficePhoneNumber.where("ulsne_site_id = ?", @unit.id)
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