class HigMaosObservation < ActiveRecord::Base
	OBSERVATIONS_COUNT_MIN = 1

	belongs_to :user
	belongs_to :ulsne_site
	has_many :hig_maos_opportunities_clusters, dependent: :destroy
	accepts_nested_attributes_for :hig_maos_opportunities_clusters, reject_if: :all_blank, allow_destroy: true
	has_many :hig_maos_opportunities, through: :hig_maos_opportunities_clusters

	validates :inicio_sessao, :fim_sessao,
		presence: true
	validates :inicio_sessao, :fim_sessao,
		date: { message: " tem de ser uma data" }
	validates :inicio_sessao, :fim_sessao,
		date: { before: Proc.new { Date.tomorrow }, message: ' tem de ser numa data anterior' },
		on: :create
	validates :fim_sessao,
		date: { after: :inicio_sessao, message: ' tem de ser posterior ao inicio de sessão' }
	validate do
		check_observations_number
	end
	
	private

	def observations_count_valid?
		hig_maos_opportunities_clusters.reject(&:marked_for_destruction?).count >= OBSERVATIONS_COUNT_MIN
	end

	def check_observations_number
		unless observations_count_valid?
			errors.add(:base, :observations_too_short, :count => OBSERVATIONS_COUNT_MIN)
		end
	end

end