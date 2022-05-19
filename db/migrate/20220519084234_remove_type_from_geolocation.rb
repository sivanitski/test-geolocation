class RemoveTypeFromGeolocation < ActiveRecord::Migration[7.0]
  def change
    remove_column :geolocations, :type
  end
end
