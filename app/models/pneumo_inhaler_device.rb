class PneumoInhalerDevice < ActiveRecord::Base
    belongs_to :pneumo_devices_category
    has_many :pneumo_forms_inhaler_devices

    validates :designacao, :dci,
        presence: true

    scope :active, -> { where(ativo: true) }

    def full_name
        "#{pneumo_devices_category.categoria} #{designacao} #{dci}"
    end
end