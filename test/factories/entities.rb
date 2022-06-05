FactoryBot.define do
  factory :entity do
    name { Faker::Internet.email }
    tax_number { Faker::Name.name }
    address { Faker::Address.street_address }
  end
end
