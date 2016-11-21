class PneumoFormsInhalerDevice < ActiveRecord::Base
    belongs_to :pneumo_inhaler_device
    belongs_to :pneumology_form

    validates :observacao,
        presence: true
end