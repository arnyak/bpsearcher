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

ActiveRecord::Schema.define(:version => 20101022135250) do

  create_table "bpcentralorgs", :force => true do |t|
    t.string   "bpno"
    t.string   "name1"
    t.string   "name2"
    t.string   "name3"
    t.string   "name4"
    t.date     "liquidationdate"
    t.string   "loc_no_1"
    t.string   "loc_no_2"
    t.string   "chk_digit"
    t.string   "zmod_task"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bpcentralorgs", ["bpno"], :name => "index_bpcentralorgs_on_bpno"
  add_index "bpcentralorgs", ["name1"], :name => "index_bpcentralorgs_on_name1"

  create_table "bpcentrals", :force => true do |t|
    t.string   "bpno"
    t.string   "searchterm1"
    t.string   "searchterm2"
    t.string   "type"
    t.string   "centralblock"
    t.string   "titleletter"
    t.string   "notreleased"
    t.string   "standardaddress"
    t.string   "c_o_name"
    t.string   "city"
    t.string   "district"
    t.string   "postl_cod1"
    t.string   "postl_cod2"
    t.string   "postl_cod3"
    t.string   "po_box"
    t.string   "po_w_o_no"
    t.string   "po_box_cit"
    t.string   "po_box_reg"
    t.string   "pobox_ctry"
    t.string   "dont_use_pb"
    t.string   "street"
    t.string   "house_no"
    t.string   "str_suppl1"
    t.string   "str_suppl2"
    t.string   "str_suppl3"
    t.string   "location"
    t.string   "building"
    t.string   "floor"
    t.string   "room_no"
    t.string   "country"
    t.string   "region"
    t.string   "time_zone"
    t.string   "taxjurcode"
    t.string   "home_city"
    t.string   "transpzone"
    t.string   "langu"
    t.string   "comm_type"
    t.string   "bil_block_reason"
    t.string   "ord_block_reason"
    t.string   "house_num2"
    t.string   "bp_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nbcontracts",      :default => 0
    t.integer  "nbmachines",       :default => 0
  end

  add_index "bpcentrals", ["bpno"], :name => "index_bpcentrals_on_bpno"
  add_index "bpcentrals", ["postl_cod1"], :name => "index_bpcentrals_on_postl_cod1"
  add_index "bpcentrals", ["street"], :name => "index_bpcentrals_on_street"

  create_table "bpcontracts", :force => true do |t|
    t.string   "contract_no"
    t.string   "process_type"
    t.string   "serial_no"
    t.datetime "contract_enddate"
    t.string   "sold_to"
    t.string   "sold_to_name"
    t.string   "ship_to"
    t.string   "ship_to_name"
    t.string   "payer"
    t.string   "payer_name"
    t.string   "bill_to"
    t.string   "bill_to_name"
    t.string   "product_252"
    t.string   "description_252"
    t.string   "product_170"
    t.string   "description_170"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bpcontracts", ["bill_to"], :name => "index_bpcontracts_on_bill_to"
  add_index "bpcontracts", ["contract_enddate"], :name => "index_bpcontracts_on_contract_enddate"
  add_index "bpcontracts", ["ship_to"], :name => "index_bpcontracts_on_ship_to"
  add_index "bpcontracts", ["sold_to"], :name => "index_bpcontracts_on_sold_to"

  create_table "bpmachines", :force => true do |t|
    t.string   "serial_no"
    t.string   "sold_to"
    t.string   "ship_to"
    t.string   "bill_to"
    t.string   "contract_no"
    t.string   "line_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bpmachines", ["bill_to"], :name => "index_bpmachines_on_bill_to"
  add_index "bpmachines", ["contract_no"], :name => "index_bpmachines_on_contract_no"
  add_index "bpmachines", ["serial_no"], :name => "index_bpmachines_on_serial_no"
  add_index "bpmachines", ["ship_to"], :name => "index_bpmachines_on_ship_to"
  add_index "bpmachines", ["sold_to"], :name => "index_bpmachines_on_sold_to"

end
