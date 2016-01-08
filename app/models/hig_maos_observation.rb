class HigMaosObservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :ulsne_site
	has_many :hig_maos_opportunities_clusters, dependent: :destroy
	accepts_nested_attributes_for :hig_maos_opportunities_clusters, reject_if: :all_blank
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
end