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

# ActiveRecord::Schema.define(version: 20180808062536) do
ActiveRecord::Schema.define(version: 20180815043828) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.text     "text",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "text",          limit: 65535
    t.text     "image",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",       limit: 4
    t.integer  "prefecture_id", limit: 4
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_name", limit: 255
    t.string   "password",   limit: 255
  end

end
