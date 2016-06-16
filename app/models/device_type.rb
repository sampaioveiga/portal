class DeviceType < ActiveRecord::Base
	has_many :uci_devices

	validates :nome_dispositivo,
		presence: true,
		uniqueness: true
end