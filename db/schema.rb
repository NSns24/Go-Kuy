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

ActiveRecord::Schema.define(version: 20180910164553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name",                   default: "",            null: false
    t.string   "email",                  default: "",            null: false
    t.string   "dob",                    default: "",            null: false
    t.string   "phone",                  default: "",            null: false
    t.string   "license_plate",          default: "",            null: false
    t.string   "image_url",              default: "profile.png"
    t.string   "encrypted_password",     default: "",            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["dob"], name: "index_drivers_on_dob", using: :btree
    t.index ["email"], name: "index_drivers_on_email", unique: true, using: :btree
    t.index ["license_plate"], name: "index_drivers_on_license_plate", unique: true, using: :btree
    t.index ["name"], name: "index_drivers_on_name", using: :btree
    t.index ["phone"], name: "index_drivers_on_phone", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_drivers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "online_drivers", force: :cascade do |t|
    t.integer  "driver_id",   null: false
    t.decimal  "current_lat", null: false
    t.decimal  "current_lng", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["driver_id"], name: "index_online_drivers_on_driver_id", using: :btree
  end

  create_table "online_users", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.decimal  "pickup_lat", null: false
    t.decimal  "pickup_lng", null: false
    t.decimal  "dest_lat",   null: false
    t.decimal  "dest_lng",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_online_users_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "dob",                    default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["dob"], name: "index_users_on_dob", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["phone"], name: "index_users_on_phone", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "online_drivers", "drivers"
  add_foreign_key "online_users", "users"
end
