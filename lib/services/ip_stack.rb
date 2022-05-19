class IpStack
  API_KEY = Rails.application.credentials.dig(:ipstack, :api_key)
  BASE_URL = ENV['IP_STACK_BASE_URL']
  attr_accessor :url

  def initialize(ip)
    @url = "#{BASE_URL}/#{ip}"
  end

  def fetch_data
    begin
      response = JSON.parse(RestClient.get(@url, { params: { access_key: API_KEY } }).body).deep_transform_keys!(&:to_sym)
      data = response.except(:type, :location)
      location_hash = {}
      response[:location][:languages].map.with_index do |language, index|
        location_hash[index.to_s] = language
      end
      data[:location_attributes] = {
        geoname_id: response[:location][:geoname_id],
        capital: response[:location][:capital],
        country_flag: response[:location][:country_flag],
        country_flag_emoji: response[:location][:country_flag_emoji],
        country_flag_emoji_unicode: response[:location][:country_flag_emoji_unicode],
        calling_code: response[:location][:calling_code],
        is_eu: response[:location][:is_eu],
        languages_attributes: location_hash
      }
      data
    rescue StandardError => e
      e
    end
  end
end
