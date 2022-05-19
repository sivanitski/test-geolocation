FactoryBot.define do
  factory :geolocation do
    ip { Array.new(4){ rand(256) }.join('.') }
    continent_code { Faker::String.random(length: 2) }
    continent_name { Faker::String.random(length: 10) }
    country_code { Faker::String.random(length: 2) }
    country_name { Faker::Nation.name }
    region_code { Faker::String.random(length: 2) }
    region_name { Faker::String.random(length: 10) }
    city { Faker::Nation.capital_city }
    zip { Faker::Number.number(digits: 4).to_s }
    latitude { Faker::Number.number(digits: 6) }
    longitude { Faker::Number.number(digits: 6) }
  end
end
