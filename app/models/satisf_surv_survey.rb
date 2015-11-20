class SatisfSurvSurvey < ActiveRecord::Base
	belongs_to :user
	belongs_to :ulsne_department
	belongs_to :ulsne_site
end