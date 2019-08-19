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

ActiveRecord::Schema.define(version: 2019_08_19_105832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "duck_id"
    t.date "start"
    t.date "end"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duck_id"], name: "index_bookings_on_duck_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "duck_photos", force: :cascade do |t|
    t.bigint "duck_id"
    t.string "url"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duck_id"], name: "index_duck_photos_on_duck_id"
  end

  create_table "ducks", force: :cascade do |t|
    t.date "birthdate"
    t.bigint "user_id"
    t.string "name"
    t.string "race"
    t.string "sex"
    t.string "colour"
    t.float "weight"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ducks_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "stars"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "address"
    t.string "zip_code"
    t.string "city"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "ducks"
  add_foreign_key "bookings", "users"
  add_foreign_key "duck_photos", "ducks"
  add_foreign_key "ducks", "users"
  add_foreign_key "reviews", "bookings"
end
