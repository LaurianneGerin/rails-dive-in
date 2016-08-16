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

ActiveRecord::Schema.define(version: 20160816082517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "availabilities", force: :cascade do |t|
    t.date     "begin_date"
    t.date     "end_date"
    t.integer  "pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_availabilities_on_pool_id", using: :btree
  end

  create_table "pool_animals", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "pool_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_pool_animals_on_animal_id", using: :btree
    t.index ["pool_id"], name: "index_pool_animals_on_pool_id", using: :btree
  end

  create_table "pools", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "width"
    t.integer  "height"
    t.integer  "depth"
    t.string   "color"
    t.boolean  "pool_house"
    t.boolean  "pool_toys"
    t.string   "pool_type"
    t.string   "address"
    t.string   "water_type"
    t.integer  "capacity"
    t.text     "description"
    t.boolean  "alcohol"
    t.boolean  "soft"
    t.boolean  "bbq"
    t.integer  "pool_girl"
    t.integer  "pool_boy"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_pools_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pool_id"
    t.date     "begin_date"
    t.date     "end_date"
    t.string   "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_reservations_on_pool_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "availabilities", "pools"
  add_foreign_key "pool_animals", "animals"
  add_foreign_key "pool_animals", "pools"
  add_foreign_key "pools", "users"
  add_foreign_key "reservations", "pools"
  add_foreign_key "reservations", "users"
end
