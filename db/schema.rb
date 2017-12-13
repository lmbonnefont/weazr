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


ActiveRecord::Schema.define(version: 20171213091732) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_days", force: :cascade do |t|
    t.bigint "campaign_id"
    t.date "date"
    t.float "budget_forcast"
    t.float "budget_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "happened", default: false
    t.float "indice_rain"
    t.float "indice_temperature"
    t.float "indice_damp"
    t.float "indice_daily"
    t.float "indice_bau"
    t.index ["campaign_id"], name: "index_campaign_days_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.bigint "company_id"
    t.date "start"
    t.date "end"
    t.integer "budget_total"
    t.integer "budget_remaining"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "budget_fb"
    t.integer "target_age_min"
    t.integer "target_age_max"
    t.text "post_msg"
    t.string "post_title"
    t.string "photo"
    t.boolean "display", default: true
    t.float "usualbudget"
    t.string "title"
    t.string "cpm"
    t.string "cpc"
    t.string "post_engagements"
    t.string "btn_click"
    t.string "impressions"
    t.boolean "active", default: true
    t.index ["company_id"], name: "index_campaigns_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "economic_sector_id"
    t.string "photo"
    t.string "account_id"
    t.string "website_url"
    t.string "page_id"
    t.string "pixel_id"
    t.index ["economic_sector_id"], name: "index_companies_on_economic_sector_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "dashboards", force: :cascade do |t|
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_dashboards_on_company_id"
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

  create_table "meteos", force: :cascade do |t|
    t.float "damp"
    t.float "rain"
    t.float "temperature"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "indice_rain"
    t.float "indice_damp"
    t.float "indice_temperature"
    t.float "indice_day_absolute"
    t.float "indice_day_relative"
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
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaign_days", "campaigns"
  add_foreign_key "campaigns", "companies"
  add_foreign_key "companies", "economic_sectors"
  add_foreign_key "companies", "users"
  add_foreign_key "dashboards", "companies"
  add_foreign_key "inputs", "companies"
end
