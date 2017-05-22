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

ActiveRecord::Schema.define(version: 20161207134754) do

  create_table "checkers", force: :cascade do |t|
    t.boolean  "value"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contexts", force: :cascade do |t|
    t.string   "name"
    t.boolean  "out_sity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "number"
    t.string   "password"
    t.integer  "pickupgroup"
    t.integer  "callgroup"
    t.string   "callerid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "context_id"
    t.integer  "status_id"
    t.integer  "delay"
  end

  add_index "phones", ["context_id"], name: "index_phones_on_context_id"
  add_index "phones", ["status_id"], name: "index_phones_on_status_id"

  create_table "settings", force: :cascade do |t|
    t.text     "config"
    t.text     "name_option"
    t.text     "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end