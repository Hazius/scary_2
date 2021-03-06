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

ActiveRecord::Schema.define(version: 20140629120329) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "film_id"
    t.boolean  "liked"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "moderating", default: true
  end

  create_table "films", force: true do |t|
    t.string   "name_rus"
    t.integer  "year"
    t.text     "short_description"
    t.text     "full_description"
    t.string   "link_to_kinopoisk"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "producer"
    t.string   "name_eng"
    t.boolean  "now_in_cinemas",    default: false
    t.boolean  "future_in_cinemas", default: false
    t.string   "russian_premiere"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
