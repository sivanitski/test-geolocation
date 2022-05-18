class Location < ApplicationRecord
  belongs_to :geolocation
  has_many :languages, dependent: :destroy
  accepts_nested_attributes_for :languages
end
