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

ActiveRecord::Schema.define(version: 2019_04_14_195715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "number"
    t.integer "acreage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.index ["owner_id"], name: "index_areas_on_owner_id"
  end

  create_table "bait_ids", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catches", force: :cascade do |t|
    t.integer "size"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fish_id_id"
    t.bigint "time_id_id"
    t.bigint "bait_id_id"
    t.bigint "method_id_id"
    t.bigint "user_id"
    t.bigint "area_id"
    t.index ["area_id"], name: "index_catches_on_area_id"
    t.index ["bait_id_id"], name: "index_catches_on_bait_id_id"
    t.index ["fish_id_id"], name: "index_catches_on_fish_id_id"
    t.index ["method_id_id"], name: "index_catches_on_method_id_id"
    t.index ["time_id_id"], name: "index_catches_on_time_id_id"
    t.index ["user_id"], name: "index_catches_on_user_id"
  end

  create_table "fish_ids", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "method_ids", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_ids", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.integer "age"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "areas", "owners"
  add_foreign_key "catches", "areas"
  add_foreign_key "catches", "bait_ids"
  add_foreign_key "catches", "fish_ids"
  add_foreign_key "catches", "method_ids"
  add_foreign_key "catches", "time_ids"
  add_foreign_key "catches", "users"
end
