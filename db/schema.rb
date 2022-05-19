# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_19_084234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geolocations", force: :cascade do |t|
    t.string "ip"
    t.string "continent_code"
    t.string "continent_name"
    t.string "country_code"
    t.string "country_name"
    t.string "region_code"
    t.string "region_name"
    t.string "city"
    t.string "zip"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "native"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_languages_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "geoname_id"
    t.string "capital"
    t.string "country_flag"
    t.string "country_flag_emoji"
    t.string "country_flag_emoji_unicode"
    t.string "calling_code"
    t.boolean "is_eu"
    t.bigint "geolocation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geolocation_id"], name: "index_locations_on_geolocation_id"
  end

end
