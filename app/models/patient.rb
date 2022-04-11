class Patient < ApplicationRecord
  belongs_to :entity
  has_many :medical_cares
  has_many :health_professionals, through: :medical_cares
end
