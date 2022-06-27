# == Schema Information
#
# Table name: disease_patients
#
#  id         :bigint           not null, primary key
#  patient_id :bigint           not null
#  disease_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :disease_patient do
    
  end
end
