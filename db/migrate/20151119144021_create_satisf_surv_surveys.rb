class CreateSatisfSurvSurveys < ActiveRecord::Migration
	def change
		create_table :satisf_surv_surveys do |t|
			t.belongs_to :user, index: true
			t.belongs_to :ulsne_department, index: true
			t.belongs_to :ulsne_site, index: true
			
			t.integer :idade
			t.integer :sexo
			t.integer :escolaridade

			#qt 1
			t.integer :simpatia_disponibilidade
			t.integer :informacao_esclarecimentos

			#qt 2
			t.integer :atencao_disponibilidade_medicos
			t.integer :medicos_explicaram_doenca
			t.integer :medicos_explicaram_medicacao
			t.integer :desempenho_medicos

			#qt 3
			t.integer :atencao_disponibilizada_enfermeiros
			t.integer :rapidez_servico_enfermagem
			t.integer :desempenho_enfermeiros

			#qt 4
			t.integer :avaliacao_pessoal_auxiliar
			t.integer :avaliacao_outros
			t.string :outros

			#qt 5
			t.integer :conforto_enfermarias
			t.integer :limpeza_higiene
			t.integer :protecao_enfermarias

			#qt 6
			t.integer :recomendaria_servico

			#qt 7
			t.integer :globalmente_satisfeito		
			
			#qt 8
			t.string :opiniao

			t.timestamps null: false
		end
	end
end
