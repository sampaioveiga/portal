class UciTissValue < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user
	before_save :calculate_valor

	validates :user_id,
		presence: true
	validates :data,
		presence: true,
		date: true,
		uniqueness: { scope: [:patient_id], message: "já tem avaliação"}

	scope :day, ->(time) { where("data = ?", time) }

	private

	def calculate_valor
		self.valor = self.b1_q1 +
					 self.b1_q2 +
					 self.b1_q3 +
					 self.b1_q4 +
					 self.b1_q5 +
					 self.b1_q6 +
					 self.b1_q7 +
					 self.b2_q1 +
					 self.b2_q2 +
					 self.b2_q3 +
					 self.b2_q4 +
					 self.b3_q1 +
					 self.b3_q2 +
					 self.b3_q3 +
					 self.b3_q4 +
					 self.b3_q5 +
					 self.b3_q6 +
					 self.b3_q7 +
					 self.b4_q1 +
					 self.b4_q2 +
					 self.b4_q3 +
					 self.b5_q1 +
					 self.b6_q1 +
					 self.b6_q2 +
					 self.b6_q3 +
					 self.b7_q1 +
					 self.b7_q2 +
					 self.b7_q3
	end
end