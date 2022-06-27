# == Schema Information
#
# Table name: medical_records
#
#  id                     :bigint           not null, primary key
#  start_date             :datetime
#  end_date               :datetime
#  patient_id             :bigint           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  health_professional_id :bigint
#  observations           :text
#
FactoryBot.define do
  factory :medical_record do
    
  end
end
