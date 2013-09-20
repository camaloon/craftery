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

ActiveRecord::Schema.define(version: 20130919155414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptance_criteria", force: true do |t|
    t.text     "description"
    t.string   "state"
    t.integer  "user_story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  add_index "acceptance_criteria", ["author_id"], name: "index_acceptance_criteria_on_author_id", using: :btree
  add_index "acceptance_criteria", ["user_story_id"], name: "index_acceptance_criteria_on_user_story_id", using: :btree

  create_table "business_goals", force: true do |t|
    t.text     "description"
    t.string   "state"
    t.integer  "feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  add_index "business_goals", ["author_id"], name: "index_business_goals_on_author_id", using: :btree
  add_index "business_goals", ["feature_id"], name: "index_business_goals_on_feature_id", using: :btree

  create_table "features", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "owner_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "features", ["owner_id"], name: "index_features_on_owner_id", using: :btree
  add_index "features", ["project_id"], name: "index_features_on_project_id", using: :btree

  create_table "personas", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personas", ["project_id"], name: "index_personas_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "user_stories", force: true do |t|
    t.integer  "author_id"
    t.integer  "persona_id"
    t.text     "desire"
    t.text     "benefit"
    t.integer  "feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_stories", ["author_id"], name: "index_user_stories_on_author_id", using: :btree
  add_index "user_stories", ["feature_id"], name: "index_user_stories_on_feature_id", using: :btree
  add_index "user_stories", ["persona_id"], name: "index_user_stories_on_persona_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
