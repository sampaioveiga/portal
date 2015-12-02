class HigMaosWorkerCategory < ActiveRecord::Base
	has_many :hig_maos_opportunities_clusters

	validates :categoria_profissional,
		presence: true,
		uniqueness: true
end