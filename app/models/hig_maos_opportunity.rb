class HigMaosOpportunity < ActiveRecord::Base
	belongs_to :hig_maos_opportunities_cluster

	validate :existe_indicacao
	validate :existe_accao
	validate :accao_incompativel

	private

	def existe_indicacao
		unless antes_doente? || antes_assetico? || apos_sangue_fluido? || apos_doente? || apos_ambiente?
			errors.add(:antes_doente, " Tem de preencher pelo menos uma indicação")
		end
	end

	def existe_accao
		unless friccao_antisetica? || lavagem? || nao_realizado?
			errors.add(:friccao_antisetica, " Tem de preencher pelo menos uma acção")
		end
	end

	def accao_incompativel
		if nao_realizado? && friccao_antisetica?
			errors.add(:nao_realizado, " e fricção antiséptica são incompatíveis")
		elsif nao_realizado? && lavagem?
			errors.add(:nao_realizado, " e lavagem são incompatíveis")
		end
	end

end