# == Schema Information
#
# Table name: entities
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  tax_number             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  address                :string
#  photo                  :string
#  uid                    :string
#  phone                  :string
#  age                    :integer
#  health_professional_id :bigint
#  patient_id             :bigint
#
FactoryBot.define do
  factory :entity do
    name { Faker::Name.name  }
    tax_number { Faker::Number.number(digits: 9) }
    address { Faker::Address.street_address }
    photo { Faker::Placeholdit.image }
  end
end
