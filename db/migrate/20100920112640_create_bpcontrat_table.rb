class CreateBpcontratTable < ActiveRecord::Migration
  def self.up
    create_table :bpcontracts do |t|
      t.string :contract_no
      t.string :process_type
      t.string :serial_no
      t.datetime :contract_enddate
      t.string :sold_to
      t.string :sold_to_name
      t.string :ship_to
      t.string :ship_to_name
      t.string :payer
      t.string :payer_name
      t.string :bill_to
      t.string :bill_to_name
      t.string :product_252
      t.string :description_252
      t.string :product_170
      t.string :description_170

      t.timestamps
    end
  end

  def self.down
    drop_table :bpcontracts
  end
end
