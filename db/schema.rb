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

ActiveRecord::Schema.define(version: 20150615222528) do

  create_table "answers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "holas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "user",       limit: 255
    t.string   "title",      limit: 255
    t.string   "body",       limit: 255
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "posts", ["tag_id"], name: "index_posts_on_tag_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "tag_id",     limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "questions", ["post_id"], name: "index_questions_on_post_id", using: :btree
  add_index "questions", ["tag_id"], name: "index_questions_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "posts", "tags"
  add_foreign_key "questions", "posts"
  add_foreign_key "questions", "tags"
end
