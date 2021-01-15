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

ActiveRecord::Schema.define(version: 2021_01_14_044116) do

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "code"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "passenger_id", null: false
    t.integer "fly_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fly_id"], name: "index_bookings_on_fly_id"
    t.index ["passenger_id"], name: "index_bookings_on_passenger_id"
  end

  create_table "flies", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "departure_date"
    t.datetime "return_date"
    t.string "duration"
    t.index ["from_id"], name: "index_flies_on_from_id"
    t.index ["to_id"], name: "index_flies_on_to_id"
  end

  create_table "odinflights", force: :cascade do |t|
    t.integer "from_id", null: false
    t.integer "to_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_odinflights_on_from_id"
    t.index ["to_id"], name: "index_odinflights_on_to_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "flies"
  add_foreign_key "bookings", "passengers"
  add_foreign_key "odinflights", "froms"
  add_foreign_key "odinflights", "tos"
end
