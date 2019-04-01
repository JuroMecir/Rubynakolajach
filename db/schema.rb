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

ActiveRecord::Schema.define(version: 2019_04_01_120943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "number"
    t.integer "acreage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owners_id"
    t.index ["owners_id"], name: "index_areas_on_owners_id"
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
    t.bigint "fish_ids_id"
    t.bigint "time_ids_id"
    t.bigint "bait_ids_id"
    t.bigint "method_ids_id"
    t.bigint "users_id"
    t.bigint "areas_id"
    t.index ["areas_id"], name: "index_catches_on_areas_id"
    t.index ["bait_ids_id"], name: "index_catches_on_bait_ids_id"
    t.index ["fish_ids_id"], name: "index_catches_on_fish_ids_id"
    t.index ["method_ids_id"], name: "index_catches_on_method_ids_id"
    t.index ["time_ids_id"], name: "index_catches_on_time_ids_id"
    t.index ["users_id"], name: "index_catches_on_users_id"
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

  add_foreign_key "areas", "owners", column: "owners_id"
  add_foreign_key "catches", "areas", column: "areas_id"
  add_foreign_key "catches", "bait_ids", column: "bait_ids_id"
  add_foreign_key "catches", "fish_ids", column: "fish_ids_id"
  add_foreign_key "catches", "method_ids", column: "method_ids_id"
  add_foreign_key "catches", "time_ids", column: "time_ids_id"
  add_foreign_key "catches", "users", column: "users_id"
end
