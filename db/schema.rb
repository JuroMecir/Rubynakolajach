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

ActiveRecord::Schema.define(version: 2019_05_05_120740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.integer "acreage"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_areas_on_owner_id"
  end

  create_table "baits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catches", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "area_id"
    t.bigint "fish_id"
    t.bigint "bait_id"
    t.bigint "methodf_id"
    t.integer "size"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_catches_on_area_id"
    t.index ["bait_id"], name: "index_catches_on_bait_id"
    t.index ["fish_id"], name: "index_catches_on_fish_id"
    t.index ["methodf_id"], name: "index_catches_on_methodf_id"
    t.index ["user_id"], name: "index_catches_on_user_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.bigint "province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_districts_on_province_id"
  end

  create_table "fishes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "methodfs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.bigint "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_owners_on_district_id"
  end

  create_table "provinces", force: :cascade do |t|
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

  add_foreign_key "catches", "baits"
  add_foreign_key "catches", "fishes"
  add_foreign_key "catches", "methodfs"
  add_foreign_key "catches", "users"
  add_foreign_key "owners", "districts"
end
