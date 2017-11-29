# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171129041504) do

  create_table "addresses", force: :cascade do |t|
    t.integer "address_id"
    t.string "line_1"
    t.string "line_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "county"
    t.string "country"
    t.integer "community_id"
    t.string "school_district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "business_cards", force: :cascade do |t|
    t.integer "contact_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "businesses", force: :cascade do |t|
    t.integer "business_id"
    t.string "business_name"
    t.integer "address_id"
    t.string "url"
    t.string "email"
    t.integer "prim_contact_id"
    t.integer "sec_contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "communities", force: :cascade do |t|
    t.integer "community_id"
    t.string "community_name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "address_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "phone"
    t.integer "phone_ext"
    t.string "alt_phone"
    t.integer "alt_ext"
    t.string "fax"
    t.string "email"
    t.string "contact_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "images", force: :cascade do |t|
    t.integer "property_id"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "interactions", force: :cascade do |t|
    t.integer "interaction_id"
    t.integer "contact_id"
    t.datetime "date_time"
    t.string "interaction_type"
    t.string "result"
    t.text "note"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "user_email"
  end

  create_table "investor_prefs", force: :cascade do |t|
    t.integer "investor_pref_id"
    t.integer "contact_id"
    t.string "zip_code"
    t.integer "community_id"
    t.string "property_type"
    t.integer "bd_rms"
    t.integer "ba_rms"
    t.float "max"
    t.float "min"
    t.boolean "rehab_ind"
    t.boolean "main_st_ind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "prop_docs", force: :cascade do |t|
    t.integer "prop_doc_id"
    t.integer "property_id"
    t.string "content"
    t.string "mime_type"
    t.string "file_name"
    t.string "file_type"
    t.datetime "upload_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "property_id"
    t.integer "address_id"
    t.integer "owner"
    t.string "property_type"
    t.string "time_on_mrkt"
    t.string "construction"
    t.boolean "basement_ind"
    t.boolean "public_water_ind"
    t.boolean "offstreet_parking_ind"
    t.boolean "main_st_ind"
    t.boolean "garage_ind"
    t.float "sqft"
    t.integer "yr_built"
    t.integer "bd_rms"
    t.integer "ba_rms"
    t.integer "rooms"
    t.datetime "kitch_reno_date"
    t.datetime "bath_reno_date"
    t.string "roof_type"
    t.string "roof_age"
    t.boolean "roof_leaks_ind"
    t.string "plumb_type"
    t.string "plumb_age"
    t.boolean "plumb_leak_ind"
    t.string "foundation"
    t.string "heat_type"
    t.string "heat_age"
    t.boolean "heat_works"
    t.string "cool_type"
    t.string "cool_age"
    t.boolean "cool_works"
    t.string "window_type"
    t.integer "window_nbr"
    t.string "resn_to_sell"
    t.boolean "agnt_list_ind"
    t.datetime "agnt_exp_date"
    t.float "quick_close_amt"
    t.float "amt_owed"
    t.boolean "pymnt_crnt"
    t.float "pymt_amt"
    t.boolean "tax_inc_ind"
    t.float "interest_rate"
    t.boolean "pymnt_asum_ind"
    t.datetime "sell_by_date"
    t.boolean "bck_tx_ind"
    t.float "bkd_tx_amt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
  end

  create_table "property_displays", force: :cascade do |t|
    t.string "Address"
    t.string "owner"
    t.string "contactInfo"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rental_units", force: :cascade do |t|
    t.integer "rental_unit_id"
    t.integer "property_id"
    t.integer "bd_rms"
    t.integer "ba_rms"
    t.float "rent"
    t.boolean "occupied_ind"
    t.boolean "pay_heat_ind"
    t.boolean "pay_wtr_ind"
    t.boolean "pay_gas_ind"
    t.boolean "pay_elec_ind"
    t.integer "tenant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "room_id"
    t.integer "property_id"
    t.string "room_type"
    t.float "sqft"
    t.integer "windows"
    t.integer "closets"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string "user_email"
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "transaction_id"
    t.integer "purchased_by"
    t.datetime "date"
    t.integer "property_id"
    t.float "price"
    t.string "transaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zillow_prefs", force: :cascade do |t|
    t.string "user_email"
    t.boolean "links"
    t.boolean "last_sold_date"
    t.boolean "last_sold_price"
    t.boolean "tax_assessment"
    t.boolean "tax_assessment_year"
    t.boolean "year_built"
    t.boolean "bathrooms"
    t.boolean "bedrooms"
    t.boolean "finished_square_feet"
    t.boolean "lot_size_square_feet"
    t.boolean "total_rooms"
    t.boolean "use_code"
    t.boolean "change"
    t.boolean "change_duration"
    t.boolean "last_updated"
    t.boolean "local_real_estate"
    t.boolean "percentile"
    t.boolean "price"
    t.boolean "region"
    t.boolean "region_type"
    t.boolean "rent_zestimate"
    t.boolean "valuation_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
