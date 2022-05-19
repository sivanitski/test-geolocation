FactoryBot.define do
  factory :language do
    code { Faker::String.random(length: 5) }
    name { Faker::Name.name }
    native { Faker::String.random(length: 5) }
    location
  end
end
