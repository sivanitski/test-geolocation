class GeolocationSerializer < BaseSerializer

  set_type :geolocation
  set_key_transform :camel_lower

  attributes :ip, :continent_code, :continent_name, :country_code, :country_name
  attributes :region_code, :region_name, :city, :zip, :latitude, :longitude, :created_at, :updated_at

  has_one :location
end
