# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100522204115) do

  create_table "buildings", :force => true do |t|
    t.string   "building_name"
    t.string   "building_abbrv"
    t.integer  "building_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
  end

  create_table "data_points", :force => true do |t|
    t.integer  "data_set_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_sets", :force => true do |t|
    t.integer  "meter_id"
    t.integer  "point_number"
    t.string   "name"
    t.integer  "power_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hubs", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meters", :force => true do |t|
    t.integer  "building_id"
    t.integer  "modbus_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "power_units", :force => true do |t|
    t.string   "name"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
