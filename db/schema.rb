# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140304123238) do

  create_table "assets", force: true do |t|
    t.integer  "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "assets", ["hotel_id"], name: "index_assets_on_hotel_id"

  create_table "cities", force: true do |t|
    t.string   "title"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "hotel_id"
    t.integer  "rating",       default: 0
    t.text     "comment_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["hotel_id"], name: "index_comments_on_hotel_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "countries", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotels", force: true do |t|
    t.string   "title"
    t.text     "room_description"
    t.float    "price_for_room"
    t.boolean  "breakfast_included"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "avg_rating",         default: 0.0
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "street_id"
  end

  add_index "hotels", ["city_id"], name: "index_hotels_on_city_id"
  add_index "hotels", ["country_id"], name: "index_hotels_on_country_id"
  add_index "hotels", ["state_id"], name: "index_hotels_on_state_id"
  add_index "hotels", ["street_id"], name: "index_hotels_on_street_id"

  create_table "states", force: true do |t|
    t.string   "title"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id"

  create_table "streets", force: true do |t|
    t.string   "title"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "streets", ["city_id"], name: "index_streets_on_city_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
