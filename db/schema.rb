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

ActiveRecord::Schema.define(version: 20160123102954) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "asset_manages", force: :cascade do |t|
    t.string   "brand"
    t.string   "category"
    t.string   "model"
    t.integer  "owner_id"
    t.string   "producer"
    t.string   "product"
    t.decimal  "price",              precision: 8, scale: 2
    t.integer  "qty"
    t.integer  "stock_in_number"
    t.integer  "stock_out_number"
    t.string   "unit"
    t.text     "remarks"
    t.string   "seq"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "asset_manages", ["seq"], name: "index_asset_manages_on_seq", unique: true

  create_table "departments", force: :cascade do |t|
    t.string   "department_name", null: false
    t.string   "dept_uuid",       null: false
    t.integer  "budget"
    t.integer  "admin_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "departments", ["dept_uuid"], name: "index_departments_on_dept_uuid", unique: true

  create_table "logs", force: :cascade do |t|
    t.string   "asset_manage_seq"
    t.string   "user_uuid"
    t.integer  "admin_id"
    t.string   "action_type"
    t.integer  "qty"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "logs", ["asset_manage_seq"], name: "index_logs_on_asset_manage_seq"
  add_index "logs", ["user_uuid"], name: "index_logs_on_user_uuid"

  create_table "users", force: :cascade do |t|
    t.string   "dept_uuid",  null: false
    t.string   "username",   null: false
    t.string   "uuid",       null: false
    t.integer  "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["dept_uuid"], name: "index_users_on_dept_uuid"
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true

end
