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

ActiveRecord::Schema.define(version: 20160715023150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deals", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "neighborhood_scout"
    t.integer  "purchase_price",                               default: 0,   null: false
    t.integer  "arv",                                          default: 0,   null: false
    t.integer  "closing_costs",                                default: 0,   null: false
    t.integer  "estimated_repairs",                            default: 0,   null: false
    t.integer  "down_payment",                                 default: 0,   null: false
    t.decimal  "interest_rate",       precision: 4,  scale: 2, default: 0.0, null: false
    t.integer  "loan_points",                                  default: 0,   null: false
    t.integer  "loan_years",                                   default: 0,   null: false
    t.integer  "gross_rent",                                   default: 0,   null: false
    t.integer  "other_income",                                 default: 0,   null: false
    t.integer  "electricity",                                  default: 0,   null: false
    t.integer  "water_sewer",                                  default: 0,   null: false
    t.decimal  "pmi",                 precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "insurance",           precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "property_tax",        precision: 10, scale: 2, default: 0.0, null: false
    t.integer  "other_expenses",                               default: 0,   null: false
    t.integer  "vacancy",                                      default: 0,   null: false
    t.integer  "repairs_maintenance",                          default: 0,   null: false
    t.integer  "cap_ex",                                       default: 0,   null: false
    t.integer  "property_management",                          default: 0,   null: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

end
