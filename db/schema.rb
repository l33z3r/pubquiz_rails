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

ActiveRecord::Schema.define(version: 20140930112950) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.boolean  "in_the_eu",     limit: 1
    t.integer  "currency_id",   limit: 4
    t.integer  "sorting_order", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["currency_id"], name: "index_countries_on_currency_id", using: :btree
  add_index "countries", ["in_the_eu"], name: "index_countries_on_in_the_eu", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree
  add_index "countries", ["sorting_order"], name: "index_countries_on_sorting_order", using: :btree

  create_table "currencies", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "iso_code",            limit: 255
    t.string   "leading_symbol",      limit: 255
    t.string   "trailing_symbol",     limit: 255
    t.string   "thousands_separator", limit: 255
    t.string   "decimal_separator",   limit: 255
    t.integer  "sorting_order",       limit: 4
    t.boolean  "active",              limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "currencies", ["active"], name: "index_currencies_on_active", using: :btree
  add_index "currencies", ["iso_code"], name: "index_currencies_on_iso_code", using: :btree
  add_index "currencies", ["name"], name: "index_currencies_on_name", using: :btree
  add_index "currencies", ["sorting_order"], name: "index_currencies_on_sorting_order", using: :btree

  create_table "event_team_members", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "team_id",         limit: 4
    t.string   "referral_from",   limit: 255
    t.string   "device_platform", limit: 255
    t.string   "device_type",     limit: 255
    t.boolean  "tablet",          limit: 1
    t.boolean  "phone",           limit: 1
    t.boolean  "pc",              limit: 1
    t.integer  "app_version_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quiz_event_id",   limit: 4
  end

  add_index "event_team_members", ["team_id"], name: "index_event_team_members_on_team_id", using: :btree
  add_index "event_team_members", ["user_id"], name: "index_event_team_members_on_user_id", using: :btree

  create_table "question_answers", force: :cascade do |t|
    t.integer  "question_id",        limit: 4
    t.string   "visible_text",       limit: 255
    t.integer  "sorting_order",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "question_answers", ["question_id"], name: "index_question_answers_on_question_id", using: :btree
  add_index "question_answers", ["sorting_order"], name: "index_question_answers_on_sorting_order", using: :btree

  create_table "question_categories", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.integer  "question_category_id", limit: 4
    t.boolean  "active",               limit: 1
    t.integer  "created_by",           limit: 4
    t.integer  "updated_by",           limit: 4
    t.integer  "country_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_categories", ["active"], name: "index_question_categories_on_active", using: :btree
  add_index "question_categories", ["name"], name: "index_question_categories_on_name", using: :btree
  add_index "question_categories", ["question_category_id"], name: "index_question_categories_on_question_category_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "question_category_id", limit: 4
    t.string   "visible_text",         limit: 255
    t.integer  "correct_answer_id",    limit: 4
    t.integer  "created_by",           limit: 4
    t.integer  "updated_by",           limit: 4
    t.boolean  "publicly_visible",     limit: 1
    t.integer  "approved_by",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",      limit: 255
    t.string   "image_content_type",   limit: 255
    t.integer  "image_file_size",      limit: 4
    t.datetime "image_updated_at"
    t.integer  "country_id",           limit: 4
    t.integer  "year_from",            limit: 4
    t.integer  "year_to",              limit: 4
  end

  add_index "questions", ["approved_by"], name: "index_questions_on_approved_by", using: :btree
  add_index "questions", ["created_by"], name: "index_questions_on_created_by", using: :btree
  add_index "questions", ["publicly_visible"], name: "index_questions_on_publicly_visible", using: :btree
  add_index "questions", ["question_category_id"], name: "index_questions_on_question_category_id", using: :btree

  create_table "quiz_events", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "time_zone",          limit: 255
    t.datetime "starts_at"
    t.integer  "venue_id",           limit: 4
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.string   "event_guid",         limit: 255
    t.string   "sponsor_logo_url",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name",     limit: 255
    t.string   "logo_content_type",  limit: 255
    t.integer  "logo_file_size",     limit: 4
    t.datetime "logo_updated_at"
    t.boolean  "open_to_the_public", limit: 1
    t.string   "event_status",       limit: 255
  end

  add_index "quiz_events", ["created_by"], name: "index_quiz_events_on_created_by", using: :btree
  add_index "quiz_events", ["event_guid"], name: "index_quiz_events_on_event_guid", using: :btree
  add_index "quiz_events", ["starts_at"], name: "index_quiz_events_on_starts_at", using: :btree
  add_index "quiz_events", ["updated_by"], name: "index_quiz_events_on_updated_by", using: :btree
  add_index "quiz_events", ["venue_id"], name: "index_quiz_events_on_venue_id", using: :btree

  create_table "quiz_round_questions", force: :cascade do |t|
    t.integer  "quiz_round_id",             limit: 4
    t.integer  "question_id",               limit: 4
    t.integer  "sorting_order",             limit: 4
    t.integer  "time_limit_in_seconds",     limit: 4
    t.integer  "points_for_correct_answer", limit: 4
    t.integer  "points_for_wrong_answer",   limit: 4
    t.integer  "points_for_no_answer",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_round_questions", ["question_id"], name: "index_quiz_round_questions_on_question_id", using: :btree
  add_index "quiz_round_questions", ["quiz_round_id"], name: "index_quiz_round_questions_on_quiz_round_id", using: :btree
  add_index "quiz_round_questions", ["sorting_order"], name: "index_quiz_round_questions_on_sorting_order", using: :btree

  create_table "quiz_rounds", force: :cascade do |t|
    t.integer  "quiz_event_id",        limit: 4
    t.string   "name",                 limit: 255
    t.integer  "created_by",           limit: 4
    t.integer  "updated_by",           limit: 4
    t.integer  "question_category_id", limit: 4
    t.integer  "sorting_order",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_rounds", ["created_by"], name: "index_quiz_rounds_on_created_by", using: :btree
  add_index "quiz_rounds", ["question_category_id"], name: "index_quiz_rounds_on_question_category_id", using: :btree
  add_index "quiz_rounds", ["quiz_event_id"], name: "index_quiz_rounds_on_quiz_event_id", using: :btree
  add_index "quiz_rounds", ["sorting_order"], name: "index_quiz_rounds_on_sorting_order", using: :btree
  add_index "quiz_rounds", ["updated_by"], name: "index_quiz_rounds_on_updated_by", using: :btree

  create_table "submitted_answers", force: :cascade do |t|
    t.integer  "event_team_member_id",   limit: 4
    t.integer  "user_id",                limit: 4
    t.integer  "team_id",                limit: 4
    t.integer  "quiz_event_id",          limit: 4
    t.integer  "quiz_round_question_id", limit: 4
    t.integer  "question_answer_id",     limit: 4
    t.boolean  "correct",                limit: 1
    t.integer  "points_scored",          limit: 4
    t.datetime "question_asked_at"
    t.datetime "question_answered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quiz_round_id",          limit: 4
  end

  add_index "submitted_answers", ["event_team_member_id"], name: "index_submitted_answers_on_event_team_member_id", using: :btree
  add_index "submitted_answers", ["question_answer_id"], name: "index_submitted_answers_on_question_answer_id", using: :btree
  add_index "submitted_answers", ["quiz_event_id"], name: "index_submitted_answers_on_quiz_event_id", using: :btree
  add_index "submitted_answers", ["quiz_round_question_id"], name: "index_submitted_answers_on_quiz_round_question_id", using: :btree
  add_index "submitted_answers", ["team_id"], name: "index_submitted_answers_on_team_id", using: :btree
  add_index "submitted_answers", ["user_id"], name: "index_submitted_answers_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "quiz_event_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["quiz_event_id"], name: "index_teams_on_quiz_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "email",            limit: 255
    t.string   "image",            limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["oauth_token"], name: "index_users_on_oauth_token", using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "public_title",      limit: 255
    t.text     "address",           limit: 65535
    t.float    "latitude",          limit: 24
    t.float    "longitude",         limit: 24
    t.integer  "created_by",        limit: 4
    t.integer  "updated_by",        limit: 4
    t.boolean  "publicly_visible",  limit: 1
    t.integer  "approved_by",       limit: 4
    t.string   "time_zone",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  add_index "venues", ["created_by"], name: "index_venues_on_created_by", using: :btree
  add_index "venues", ["latitude"], name: "index_venues_on_latitude", using: :btree
  add_index "venues", ["longitude"], name: "index_venues_on_longitude", using: :btree
  add_index "venues", ["public_title"], name: "index_venues_on_public_title", using: :btree

end
