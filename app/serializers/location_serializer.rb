class LocationSerializer < BaseSerializer

  attributes :geoname_id, :capital, :country_flag, :country_flag_emoji, :country_flag_emoji_unicode, :calling_code, :is_eu, :created_at, :updated_at

  has_many :languages
end
