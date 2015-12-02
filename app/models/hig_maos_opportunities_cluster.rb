class HigMaosOpportunitiesCluster < ActiveRecord::Base
	belongs_to :hig_maos_observation
	belongs_to :hig_maos_worker_category
	has_many :hig_maos_opportunities, dependent: :destroy
	accepts_nested_attributes_for :hig_maos_opportunities, reject_if: :all_blank
	
	validates :numero_profissionais,
		presence: true,
		numericality: true
end