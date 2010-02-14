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

ActiveRecord::Schema.define(:version => 20100213230450) do

  create_table "building_types", :primary_key => "building_type_id", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", :primary_key => "building_id", :force => true do |t|
    t.string   "building_name"
    t.string   "building_abbrv"
    t.integer  "building_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
  end

  create_table "datas", :primary_key => "data_id", :force => true do |t|
    t.integer  "building_id"
    t.integer  "meter_type_id"
    t.text     "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meter_types", :primary_key => "meter_type_id", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "Mod_Bus_Address"
  end

end
