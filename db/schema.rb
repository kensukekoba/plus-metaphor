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

ActiveRecord::Schema.define(version: 20160529080827) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.integer  "metaphor_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["metaphor_id", "created_at"], name: "index_comments_on_metaphor_id_and_created_at"
  add_index "comments", ["metaphor_id"], name: "index_comments_on_metaphor_id"
  add_index "comments", ["topic_id", "created_at"], name: "index_comments_on_topic_id_and_created_at"
  add_index "comments", ["topic_id"], name: "index_comments_on_topic_id"
  add_index "comments", ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "metaphors", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "metaphors", ["topic_id", "created_at"], name: "index_metaphors_on_topic_id_and_created_at"
  add_index "metaphors", ["topic_id"], name: "index_metaphors_on_topic_id"
  add_index "metaphors", ["user_id", "created_at"], name: "index_metaphors_on_user_id_and_created_at"
  add_index "metaphors", ["user_id"], name: "index_metaphors_on_user_id"

  create_table "topics", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "title"
    t.text     "link"
    t.string   "category"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "officialflag", default: false
  end

  add_index "topics", ["user_id", "created_at"], name: "index_topics_on_user_id_and_created_at"
  add_index "topics", ["user_id"], name: "index_topics_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "favo_phrase"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "adminflag",       default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
