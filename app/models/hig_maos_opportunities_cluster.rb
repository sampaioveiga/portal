class HigMaosOpportunitiesCluster < ActiveRecord::Base
	OPPORTUNITY_COUNT_MIN = 1

	belongs_to :hig_maos_observation
	belongs_to :hig_maos_worker_category
	has_many :hig_maos_opportunities, dependent: :destroy
	accepts_nested_attributes_for :hig_maos_opportunities, reject_if: :all_blank
	
	validates :numero_profissionais,
		presence: true,
		numericality: true

	validate do
		check_opportunities_number
	end

	private

	def opportunities_count_valid?
		hig_maos_opportunities.reject(&:marked_for_destruction?).count >= OPPORTUNITY_COUNT_MIN
	end

	def check_opportunities_number
		unless opportunities_count_valid?
			errors.add(:base, :opportunities_too_short, :count => OPPORTUNITY_COUNT_MIN)
		end
	end
end