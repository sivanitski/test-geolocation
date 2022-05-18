class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string      :geoname_id
      t.string      :capital
      t.string      :country_flag
      t.string      :country_flag_emoji
      t.string      :country_flag_emoji_unicode
      t.string      :calling_code
      t.boolean     :is_eu
      t.timestamps
    end
  end
end
