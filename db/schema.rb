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

ActiveRecord::Schema.define(version: 2019_07_26_074122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interviews", force: :cascade do |t|
    t.bigint "candidate_id"
    t.string "location"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_interviews_on_candidate_id"
  end

  create_table "manager_interview_taggings", force: :cascade do |t|
    t.bigint "interview_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_id"], name: "index_manager_interview_taggings_on_interview_id"
    t.index ["manager_id"], name: "index_manager_interview_taggings_on_manager_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position_id"
  end

  create_table "person_skill_taggings", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_skill_taggings_on_person_id"
    t.index ["skill_id"], name: "index_person_skill_taggings_on_skill_id"
  end

  create_table "position_skill_taggings", force: :cascade do |t|
    t.bigint "position_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_position_skill_taggings_on_position_id"
    t.index ["skill_id"], name: "index_position_skill_taggings_on_skill_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "manager_interview_taggings", "interviews", on_delete: :cascade
  add_foreign_key "person_skill_taggings", "people", on_delete: :cascade
  add_foreign_key "person_skill_taggings", "skills", on_delete: :cascade
  add_foreign_key "position_skill_taggings", "positions", on_delete: :cascade
  add_foreign_key "position_skill_taggings", "skills", on_delete: :cascade
end
