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

ActiveRecord::Schema.define(version: 20161216005705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deals", force: :cascade do |t|
    t.integer  "purchase_price",                               default: 0,     null: false
    t.integer  "list_price",                                   default: 0,     null: false
    t.integer  "sold_price",                                   default: 0,     null: false
    t.integer  "arv",                                          default: 0,     null: false
    t.integer  "closing_costs",                                default: 0,     null: false
    t.integer  "estimated_repairs",                            default: 0,     null: false
    t.integer  "gross_rent",                                   default: 0,     null: false
    t.integer  "other_income",                                 default: 0,     null: false
    t.integer  "electricity",                                  default: 0,     null: false
    t.integer  "water_sewer",                                  default: 0,     null: false
    t.decimal  "pmi",                 precision: 10, scale: 2, default: 0.0,   null: false
    t.decimal  "insurance",           precision: 10, scale: 2, default: 0.0,   null: false
    t.decimal  "property_tax",        precision: 10, scale: 2, default: 0.0,   null: false
    t.integer  "other_expenses",                               default: 0,     null: false
    t.integer  "vacancy",                                      default: 0,     null: false
    t.integer  "repairs_maintenance",                          default: 0,     null: false
    t.integer  "cap_ex",                                       default: 0,     null: false
    t.integer  "property_management",                          default: 0,     null: false
    t.boolean  "cash_purchase",                                default: false, null: false
    t.integer  "property_id"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  add_index "deals", ["property_id"], name: "index_deals_on_property_id", using: :btree

  create_table "expense_items", force: :cascade do |t|
    t.string   "name",                          null: false
    t.integer  "amount",            default: 0, null: false
    t.integer  "monthly_report_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "expense_items", ["monthly_report_id"], name: "index_expense_items_on_monthly_report_id", using: :btree

  create_table "income_items", force: :cascade do |t|
    t.string   "name",                          null: false
    t.integer  "amount",            default: 0, null: false
    t.integer  "monthly_report_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "income_items", ["monthly_report_id"], name: "index_income_items_on_monthly_report_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "url",         null: false
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "links", ["property_id"], name: "index_links_on_property_id", using: :btree

  create_table "loans", force: :cascade do |t|
    t.integer  "amount",                                default: 0,     null: false
    t.integer  "down_payment",                          default: 0,     null: false
    t.integer  "points"
    t.integer  "ammortization",                         default: 0,     null: false
    t.integer  "fees",                                  default: 0,     null: false
    t.decimal  "interest_rate", precision: 4, scale: 2, default: 0.0,   null: false
    t.boolean  "interest_only",                         default: false, null: false
    t.integer  "deal_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "loans", ["deal_id"], name: "index_loans_on_deal_id", using: :btree

  create_table "monthly_reports", force: :cascade do |t|
    t.string   "month_year"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "monthly_reports", ["property_id"], name: "index_monthly_reports_on_property_id", using: :btree

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
