# == Schema Information
#
# Table name: health_professionals
#
#  id             :bigint           not null, primary key
#  entity_id      :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  professions_id :bigint
#
FactoryBot.define do
  factory :health_professional do
    entity
    profession
  end
end
