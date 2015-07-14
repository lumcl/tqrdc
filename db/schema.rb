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

ActiveRecord::Schema.define(version: 20150714080812) do

  create_table "tqrdc_group", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "score"
    t.integer  "owner_id",    precision: 38
    t.integer  "creator_id",  precision: 38
    t.integer  "updater_id",  precision: 38
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tqrdc_group", ["name"], name: "index_tqrdc_group_on_name"

  create_table "tqrdc_qhead", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "group_id",    precision: 38
    t.float    "score"
    t.string   "remark"
    t.integer  "owner_id",    precision: 38
    t.integer  "creator_id",  precision: 38
    t.integer  "updater_id",  precision: 38
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tqrdc_qhead", ["group_id"], name: "index_tqrdc_qhead_on_group_id"
  add_index "tqrdc_qhead", ["name"], name: "index_tqrdc_qhead_on_name"

  create_table "users", force: :cascade do |t|
    t.string   "email",                                 default: "", null: false
    t.string   "encrypted_password",                    default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          precision: 38, default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "role"
    t.integer  "supplier_id",            precision: 38
    t.string   "territory"
  end

  add_index "users", ["email"], name: "index_user_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "i_user_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_user_on_username", unique: true

end
