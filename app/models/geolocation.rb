class Geolocation < ApplicationRecord
  has_one :location, dependent: :destroy
  accepts_nested_attributes_for :location

  validates :ip, uniqueness: true, presence: true
end
