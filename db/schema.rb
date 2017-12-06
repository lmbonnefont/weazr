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


ActiveRecord::Schema.define(version: 20171206102839) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_days", force: :cascade do |t|
    t.bigint "campaign_id"
    t.date "date"
    t.float "budget_forcast"
    t.float "budget_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_days_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.bigint "company_id"
    t.date "start"
    t.date "end"
    t.integer "budget_total"
    t.integer "budget_remaining"
    t.boolean "live"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["company_id"], name: "index_campaigns_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "economic_sector_id"
    t.index ["economic_sector_id"], name: "index_companies_on_economic_sector_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "economic_sectors", force: :cascade do |t|
    t.float "damp"
    t.float "rain"
    t.float "temperature"
    t.string "name"
    t.float "sensitiveness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inputs", force: :cascade do |t|
    t.float "monday"
    t.float "tuesday"
    t.float "wednesday"
    t.float "thursday"
    t.float "friday"
    t.float "saturday"
    t.float "sunday"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_inputs_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end


  create_table "weather_sensitivenesses", force: :cascade do |t|
    t.float "damp"
    t.float "temperature"
    t.float "rain"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_weather_sensitivenesses_on_company_id"
  end

  add_foreign_key "campaign_days", "campaigns"
  add_foreign_key "campaigns", "companies"
  add_foreign_key "companies", "economic_sectors"
  add_foreign_key "companies", "users"
  add_foreign_key "inputs", "companies"
end
