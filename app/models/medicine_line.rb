class MedicineLine < ApplicationRecord
  belongs_to :medicine
  belongs_to :medical_record
end
