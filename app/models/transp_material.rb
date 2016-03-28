class TranspMaterial < ActiveRecord::Base
	belongs_to :user
	belongs_to :ulsne_department
	belongs_to :local_saida, class_name: 'TranspDestination'
	belongs_to :local_entrega, class_name: 'TranspDestination'

	scope :data_entrega_after_today_or_pendente, -> { where("data_entrega > ? OR aprovacao = ?", Date.today, 0) }

	validates :user,
		presence: true
	validates :assunto,
		presence: true
	validates :local_saida_id, :local_entrega_id,
		presence: true
	validates :data_entrega,
		presence: true,
		date: { after: Time.now + 3.hour, message: " tem de ser posterior a #{ Time.now + 3.hour }" },
		unless: :supervisor
end