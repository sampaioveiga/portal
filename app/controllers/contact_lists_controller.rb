class ContactListsController < ApplicationController
	before_action :load_dropdowns

	def people
		@contacts = User.includes(:ulsne_departments).order(:nome_utilizador)
		@contacts_by_first_letter = @contacts.group_by { |a| a.nome_utilizador[0].downcase }
		@contacts= @contacts.paginate(page: params[:page], per_page: 20)
	end

	def person
		@person = User.includes(:ulsne_site, :ulsne_departments, :user_phone_numbers).find(params[:id])
	end

	def department
		@department = UlsneDepartment.includes(:users).find(params[:id])
	end

	def unit
		@unit = UlsneSite.find(params[:id])
		@unit_departments = @unit.ulsne_departments.reorder(:nome_servico).uniq
	end

	def search
		if params[:search_string] == nil || params[:search_string].empty?
			@contacts = nil
			@departments_query = nil
			@offices = nil
		else
			c = User.arel_table
			@contacts_query = User.where(c[:nome_utilizador].matches("%#{params[:search_string]}%"))
			d = UlsneDepartment.arel_table
			@departments_query = UlsneDepartment.where(d[:nome_servico].matches("%#{params[:search_string]}%"))
			o = OfficePhoneNumber.arel_table
			@offices_query = OfficePhoneNumber.where(o[:nome_gabinete].matches("%#{params[:search_string]}%"))
		end
	end

	private

	def load_dropdowns
		@departments = UlsneDepartment.order(:nome_servico)
		@units = UlsneSite.order(:nome_unidade)
	end
end