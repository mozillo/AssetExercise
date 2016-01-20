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

ActiveRecord::Schema.define(version: 20160120142149) do

  create_table "asset_manages", force: :cascade do |t|
    t.string   "brand"
    t.string   "category"
    t.string   "model"
    t.integer  "owner_id"
    t.string   "producer"
    t.string   "product"
    t.decimal  "price",            precision: 8, scale: 2
    t.integer  "qty"
    t.integer  "stock_in_number"
    t.integer  "stock_out_number"
    t.integer  "unit"
    t.text     "remarks"
    t.string   "seq"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

end
