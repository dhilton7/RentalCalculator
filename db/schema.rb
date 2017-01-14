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

ActiveRecord::Schema.define(version: 20170114022056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deals", force: :cascade do |t|
    t.integer  "purchase_price",                                               null: false
    t.integer  "list_price",                                                   null: false
    t.integer  "sold_price",                                   default: 0,     null: false
    t.integer  "arv",                                                          null: false
    t.integer  "closing_costs",                                                null: false
    t.integer  "estimated_repairs",                                            null: false
    t.integer  "cap_rate",                                                     null: false
    t.integer  "gross_rent",                                                   null: false
    t.integer  "other_income",                                 default: 0,     null: false
    t.integer  "electricity",                                  default: 0,     null: false
    t.integer  "water_sewer",                                  default: 0,     null: false
    t.decimal  "pmi",                 precision: 10, scale: 2, default: 0.0,   null: false
    t.decimal  "insurance",           precision: 10, scale: 2,                 null: false
    t.decimal  "property_tax",        precision: 10, scale: 2,                 null: false
    t.integer  "other_expenses",                               default: 0,     null: false
    t.integer  "vacancy",                                                      null: false
    t.integer  "repairs_maintenance",                                          null: false
    t.integer  "cap_ex",                                                       null: false
    t.integer  "property_management",                                          null: false
    t.boolean  "cash_purchase",                                default: false, null: false
    t.integer  "property_id"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  add_index "deals", ["property_id"], name: "index_deals_on_property_id", using: :btree

  create_table "entries", force: :cascade do |t|
    t.integer  "amount",            null: false
    t.string   "account",           null: false
    t.string   "description"
    t.date     "date"
    t.integer  "property_id"
    t.integer  "entry_category_id"
    t.integer  "sheet_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "entries", ["entry_category_id"], name: "index_entries_on_entry_category_id", using: :btree
  add_index "entries", ["property_id"], name: "index_entries_on_property_id", using: :btree
  add_index "entries", ["sheet_id"], name: "index_entries_on_sheet_id", using: :btree

  create_table "entry_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.boolean  "debt"
    t.boolean  "operating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "url",         null: false
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "links", ["property_id"], name: "index_links_on_property_id", using: :btree

  create_table "loans", force: :cascade do |t|
    t.integer  "amount",                                                null: false
    t.integer  "down_payment",                                          null: false
    t.integer  "points"
    t.integer  "ammortization",                                         null: false
    t.integer  "fees",                                  default: 0,     null: false
    t.decimal  "interest_rate", precision: 4, scale: 2,                 null: false
    t.boolean  "interest_only",                         default: false, null: false
    t.integer  "deal_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "loans", ["deal_id"], name: "index_loans_on_deal_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "address",                         null: false
    t.string   "city",                            null: false
    t.string   "state",                           null: false
    t.string   "zip",                             null: false
    t.string   "status",     default: "prospect", null: false
    t.text     "notes"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id"
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id", using: :btree

  create_table "sheets", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sheets", ["user_id"], name: "index_sheets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
