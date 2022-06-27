# == Schema Information
#
# Table name: medicine_lines
#
#  id                :bigint           not null, primary key
#  medicine_id       :bigint           not null
#  medical_record_id :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :medicine_line do
    
  end
end
