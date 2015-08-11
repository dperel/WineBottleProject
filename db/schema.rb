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

ActiveRecord::Schema.define(version: 20150811211149) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vineyard_id"
    t.string   "btc_address"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "description"
    t.string   "private_key"
    t.string   "public_key"
    t.boolean  "is_sold",                 default: false
    t.string   "vineyard_name"
    t.string   "wine_type"
    t.integer  "vintage"
    t.string   "designation"
    t.string   "brand_name"
    t.string   "provenance"
    t.string   "stringified_description"
    t.string   "url"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "current_location"
  end

  create_table "histories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.boolean  "is_vineyard"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "business_name"
    t.string   "stringified_location"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "verifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vineyards", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wine_faucets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
