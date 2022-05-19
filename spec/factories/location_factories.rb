FactoryBot.define do
  factory :location do
    geoname_id { Faker::Number.number(digits: 7) }
    capital { Faker::String.random(length: 10) }
    country_flag { Faker::String.random(length: 10) }
    country_flag_emoji { Faker::Nation.flag }
    country_flag_emoji_unicode { Faker::String.random(length: 10) }
    calling_code { Faker::Number.number(digits: 1).to_s }
    is_eu { Faker::Boolean.boolean }
    geolocation
  end
end
