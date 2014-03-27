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

ActiveRecord::Schema.define(version: 2014032113440000) do

  create_table "dummy_models", force: true do |t|
    t.text     "field1"
    t.text     "field2"
    t.text     "field3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horses", force: true do |t|
    t.string   "name"
    t.string   "length"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dummy_model_id"
  end

  create_table "poneys", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "dummy_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "poneys", ["dummy_model_id"], name: "index_poneys_on_dummy_model_id", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes", limit: 2147483647
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
