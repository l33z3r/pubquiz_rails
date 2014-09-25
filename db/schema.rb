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

ActiveRecord::Schema.define(version: 20140925205132) do

  create_table "countries", force: true do |t|
    t.string   "name"
    t.boolean  "in_the_eu"
    t.integer  "currency_id"
    t.integer  "sorting_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.string   "iso_code"
    t.string   "leading_symbol"
    t.string   "trailing_symbol"
    t.string   "thousands_separator"
    t.string   "decimal_separator"
    t.integer  "sorting_order"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_team_members", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "referral_from"
    t.string   "device_platform"
    t.string   "device_type"
    t.boolean  "tablet"
    t.boolean  "phone"
    t.boolean  "pc"
    t.integer  "app_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_answers", force: true do |t|
    t.integer  "question_id"
    t.string   "visible_text"
    t.integer  "sorting_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "question_categories", force: true do |t|
    t.string   "name"
    t.integer  "question_category_id"
    t.boolean  "active"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "question_category_id"
    t.string   "visible_text"
    t.integer  "correct_answer_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "publicly_visible"
    t.integer  "approved_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "quiz_events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "time_zone"
    t.datetime "starts_at"
    t.integer  "venue_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "event_guid"
    t.string   "sponsor_logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "open_to_the_public"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "quiz_event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "public_title"
    t.text     "address"
    t.float    "latitude",          limit: 24
    t.float    "longitude",         limit: 24
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "publicly_visible"
    t.integer  "approved_by"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

end
