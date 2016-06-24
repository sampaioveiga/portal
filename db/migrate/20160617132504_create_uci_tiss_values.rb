class CreateUciTissValues < ActiveRecord::Migration
	def change
		create_table :uci_tiss_values do |t|
			t.references :patient, index: true
			t.references :user, index: true
			t.date :data
			t.decimal :valor
			# Atividades basicas
			t.decimal :b1_q1, default: 0
			t.decimal :b1_q2, default: 0
			t.decimal :b1_q3, default: 0
			t.decimal :b1_q4, default: 0
			t.decimal :b1_q5, default: 0
			t.decimal :b1_q6, default: 0
			t.decimal :b1_q7, default: 0

			# Suporte ventilatorio
			t.decimal :b2_q1, default: 0
			t.decimal :b2_q2, default: 0
			t.decimal :b2_q3, default: 0
			t.decimal :b2_q4, default: 0

			# Suporte cardiovascular
			t.decimal :b3_q1, default: 0
			t.decimal :b3_q2, default: 0
			t.decimal :b3_q3, default: 0
			t.decimal :b3_q4, default: 0
			t.decimal :b3_q5, default: 0
			t.decimal :b3_q6, default: 0
			t.decimal :b3_q7, default: 0

			# Suporte renal
			t.decimal :b4_q1, default: 0
			t.decimal :b4_q2, default: 0
			t.decimal :b4_q3, default: 0

			# Suporte neurologico
			t.decimal :b5_q1, default: 0

			# Suporte metabolico
			t.decimal :b6_q1, default: 0
			t.decimal :b6_q2, default: 0
			t.decimal :b6_q3, default: 0

			# Intervenções especificas
			t.decimal :b7_q1, default: 0
			t.decimal :b7_q2, default: 0
			t.decimal :b7_q3, default: 0

			t.timestamps null: false
		end
	end
end
