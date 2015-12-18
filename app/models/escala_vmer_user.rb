class EscalaVmerUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :escala_vmer_group
end