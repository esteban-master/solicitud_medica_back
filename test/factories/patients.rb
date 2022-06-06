# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  entity_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :patient do
    entity
  end
end
