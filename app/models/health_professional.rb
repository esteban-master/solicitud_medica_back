class HealthProfessional < ApplicationRecord
  belongs_to :entity
  has_many :medical_cares
  has_many :patients, through: :medical_cares
end
