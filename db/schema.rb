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

ActiveRecord::Schema.define(version: 20150803053554) do

  create_table "tqrdc_flow", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "qhead_id",    precision: 38
    t.string   "role"
    t.string   "territory"
    t.integer  "user_id",     precision: 38
    t.integer  "seq",         precision: 38
    t.integer  "next_seq",    precision: 38
    t.integer  "owner_id",    precision: 38
    t.integer  "creator_id",  precision: 38
    t.integer  "updater_id",  precision: 38
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tqrdc_flow", ["qhead_id"], name: "index_tqrdc_flow_on_qhead_id"

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

  create_table "tqrdc_order", force: :cascade do |t|
    t.integer  "supplier_id", precision: 38
    t.string   "period"
    t.string   "status"
    t.string   "territory"
    t.float    "total"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tqrdc_order", ["period"], name: "index_tqrdc_order_on_period"
  add_index "tqrdc_order", ["supplier_id"], name: "i_tqrdc_order_supplier_id"
  add_index "tqrdc_order", ["territory"], name: "index_tqrdc_order_on_territory"

  create_table "tqrdc_order_group", force: :cascade do |t|
    t.integer  "order_id",   precision: 38
    t.integer  "group_id",   precision: 38
    t.string   "status"
    t.float    "total"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tqrdc_order_group", ["group_id"], name: "i_tqrdc_order_group_group_id"
  add_index "tqrdc_order_group", ["order_id"], name: "i_tqrdc_order_group_order_id"

  create_table "tqrdc_order_line", force: :cascade do |t|
    t.integer  "order_id",       precision: 38
    t.integer  "order_group_id", precision: 38
    t.string   "status"
    t.integer  "qhead_id",       precision: 38
    t.float    "final_score"
    t.float    "u1_score"
    t.integer  "u1_user_id",     precision: 38
    t.text     "u1_comment"
    t.datetime "u1_sign_date"
    t.string   "u1_ip"
    t.string   "u1_role"
    t.integer  "u1_qline_id",    precision: 38
    t.float    "u2_score"
    t.integer  "u2_user_id",     precision: 38
    t.text     "u2_comment"
    t.datetime "u2_sign_date"
    t.string   "u2_ip"
    t.string   "u2_role"
    t.integer  "u2_qline_id",    precision: 38
    t.float    "u3_score"
    t.integer  "u3_user_id",     precision: 38
    t.text     "u3_comment"
    t.datetime "u3_sign_date"
    t.string   "u3_ip"
    t.string   "u3_role"
    t.integer  "u3_qline_id",    precision: 38
    t.float    "u4_score"
    t.integer  "u4_user_id",     precision: 38
    t.text     "u4_comment"
    t.datetime "u4_sign_date"
    t.string   "u4_ip"
    t.string   "u4_role"
    t.integer  "u4_qline_id",    precision: 38
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "tqrdc_order_line", ["order_group_id"], name: "i_tqr_ord_lin_ord_gro_id"
  add_index "tqrdc_order_line", ["order_id"], name: "i_tqrdc_order_line_order_id"
  add_index "tqrdc_order_line", ["qhead_id"], name: "i_tqrdc_order_line_qhead_id"

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

  create_table "tqrdc_qline", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "group_id",    precision: 38
    t.float    "score"
    t.integer  "qhead_id",    precision: 38
    t.integer  "owner_id",    precision: 38
    t.integer  "creator_id",  precision: 38
    t.integer  "updater_id",  precision: 38
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tqrdc_qline", ["qhead_id"], name: "index_tqrdc_qline_on_qhead_id"

  create_table "tqrdc_supplier", force: :cascade do |t|
    t.string   "supplier"
    t.integer  "commodity_mgr_id", precision: 38
    t.string   "start_period"
    t.string   "end_period"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "territory"
    t.string   "vname"
    t.string   "email"
    t.string   "mtype"
  end

  add_index "tqrdc_supplier", ["supplier"], name: "i_tqrdc_supplier_supplier"

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
