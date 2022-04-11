class MedicalCare < ApplicationRecord
  belongs_to :patient
  belongs_to :health_professional
end
