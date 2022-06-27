# == Schema Information
#
# Table name: medicines
#
#  id         :bigint           not null, primary key
#  name       :string
#  dose       :string
#  management :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :medicine do
    name { "MyString" }
  end
end
