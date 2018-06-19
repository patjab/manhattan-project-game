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

ActiveRecord::Schema.define(version: 2018_06_19_173417) do

  create_table "matches", force: :cascade do |t|
    t.integer "challenger_id"
    t.integer "challenged_id"
    t.boolean "accepted"
    t.integer "current_turn_nation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenged_id"], name: "index_matches_on_challenged_id"
    t.index ["challenger_id"], name: "index_matches_on_challenger_id"
  end

  create_table "nation_questions", force: :cascade do |t|
    t.integer "question_id"
    t.integer "nation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nation_id"], name: "index_nation_questions_on_nation_id"
    t.index ["question_id"], name: "index_nation_questions_on_question_id"
  end

  create_table "nations", force: :cascade do |t|
    t.string "nation_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["person_id"], name: "index_questions_on_person_id"
  end

end
