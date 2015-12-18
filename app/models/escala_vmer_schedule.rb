class EscalaVmerSchedule < ActiveRecord::Base
	belongs_to :user

	validates :inicio_turno,
		presence: true,
		date: { after: Proc.new { Time.now }, message: " tem de ter data posterior" },
		uniqueness: { scope: [:user_id], message: "já tem essa disponibilidade criada"}
	validates :tipo_turno,
		presence: true
end