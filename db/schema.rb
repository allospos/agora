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

ActiveRecord::Schema.define(version: 20161123134326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.string   "price"
    t.integer  "delivery_method_id"
    t.string   "delivery_charge"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
    t.index ["delivery_method_id"], name: "index_cart_items_on_delivery_method_id", using: :btree
    t.index ["item_id"], name: "index_cart_items_on_item_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "delivery_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_delivery_methods", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "delivery_method_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["delivery_method_id"], name: "index_item_delivery_methods_on_delivery_method_id", using: :btree
    t.index ["item_id"], name: "index_item_delivery_methods_on_item_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.string   "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "condition"
    t.string   "item_type"
    t.json     "images"
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "user_favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_user_favourites_on_item_id", using: :btree
    t.index ["user_id"], name: "index_user_favourites_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "username",                       null: false
    t.string   "full_name",                      null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "phone"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "verification_methods", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "token"
    t.datetime "verified_at"
    t.datetime "expires_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_verification_methods_on_user_id", using: :btree
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "delivery_methods"
  add_foreign_key "cart_items", "items"
  add_foreign_key "carts", "users"
  add_foreign_key "item_delivery_methods", "delivery_methods"
  add_foreign_key "item_delivery_methods", "items"
  add_foreign_key "items", "users"
  add_foreign_key "user_favourites", "items"
  add_foreign_key "user_favourites", "users"
  add_foreign_key "verification_methods", "users"
end
