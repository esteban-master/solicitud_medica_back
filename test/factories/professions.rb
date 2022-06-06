FactoryBot.define do
  factory :profession do
    name { Faker::Company.profession }
  end
end
