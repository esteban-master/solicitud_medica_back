class MedicalRecord < ApplicationRecord
  has_many :medicine_lines
  belongs_to :patient
  belongs_to :health_professional
end
