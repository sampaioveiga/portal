class PneumoDevicesCategory < ActiveRecord::Base
    has_many :pneumo_inhaler_devices

    validates :categoria,
        uniqueness: true
end