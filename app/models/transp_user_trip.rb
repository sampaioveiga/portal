class TranspUserTrip < ActiveRecord::Base
	belongs_to :user
	belongs_to :ulsne_department
	belongs_to :transp_destination
end