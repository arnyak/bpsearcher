class CreateBpcentralTable < ActiveRecord::Migration
  def self.up
    create_table :bpcentrals do |t|
      t.string :bpno
      t.string :searchterm1
      t.string :searchterm2
      t.string :type
      t.string :centralblock
      t.string :titleletter
      t.string :notreleased
      t.string :standardaddress
      t.string :c_o_name
      t.string :city
      t.string :district
      t.string :postl_cod1
      t.string :postl_cod2
      t.string :postl_cod3
      t.string :po_box
      t.string :po_w_o_no
      t.string :po_box_cit 
      t.string :po_box_reg
      t.string :pobox_ctry
      t.string :dont_use_pb
      t.string :street
      t.string :house_no
      t.string :str_suppl1
      t.string :str_suppl2
      t.string :str_suppl3
      t.string :location
      t.string :building
      t.string :floor
      t.string :room_no
      t.string :country
      t.string :region
      t.string :time_zone
      t.string :taxjurcode
      t.string :home_city
      t.string :transpzone
      t.string :langu
      t.string :comm_type
      t.string :bil_block_reason
      t.string :ord_block_reason
      t.string :house_num2
      t.string :bp_type

      t.timestamps
    end
  end

  def self.down
    drop_table :bpcentrals
  end
end
