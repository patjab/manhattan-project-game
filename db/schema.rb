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

ActiveRecord::Schema.define(version: 2018_06_22_033425) do

  create_table "matches", force: :cascade do |t|
    t.integer "challenger_id"
    t.integer "challenged_id"
    t.boolean "accepted"
    t.integer "current_turn_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_question_id"
    t.integer "challenger_strikes", default: 0
    t.integer "challenged_strikes", default: 0
    t.boolean "espionage_on_challenger", default: false
    t.boolean "espionage_on_challenged", default: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "option_a"
    t.string "option_b"
    t.string "option_c"
    t.string "option_d"
    t.string "answer"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_questions", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "match_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "nation_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
