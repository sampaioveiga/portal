class TranspUserTrip < ActiveRecord::Base
	belongs_to :user
	belongs_to :ulsne_department
	belongs_to :transp_destination
	belongs_to :local_inicio, class_name: 'UlsneSite'
	belongs_to :local_fim, class_name: 'UlsneSite'

	validates :user_id, :assunto, :condutor, :transp_destination_id,
		presence: true
	validates :numero_passageiros,
		presence: true,
		numericality: { greater_than: 0, less_than: 6 }
	validates :data_inicio, :data_fim,
		date: true
	validate :valid_data_inicio
	validates :data_fim,
		date: { after: :data_inicio, message: ' não pode ser antes do início' }

	scope :data_inicio_after_today, -> { where("data_inicio > ?", Date.today) }

	private

	def valid_data_inicio
		unless supervisor?
			now = Time.now
			today = Date.today
			tomorrow = today + 1.day
			
			case
			when (data_inicio < tomorrow)
				errors.add(:data_inicio, " não pode ser para hoje")
			when (today.friday? && now > today + 15.hour && data_inicio < tomorrow + 72.hour) #sunday
				errors.add(:data_inicio, " só pode ser para terça")
			when (today.saturday? && data_inicio < tomorrow + 48.hour) #saturday
				errors.add(:data_inicio, " só pode ser para terça")
			when (today.sunday? && data_inicio < tomorrow + 24.hour) #sunday
				errors.add(:data_inicio, " só pode ser para terça")
			when (now > today + 15.hour && data_inicio < tomorrow + 24.hour)
				errors.add(:data_inicio, " não ser para amanhã (passa das 15h)")
			end
		end
	end
end