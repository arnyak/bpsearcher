class CreateBpmachinesTables < ActiveRecord::Migration
  def self.up
    create_table :bpmachines do |t|
      t.string :serial_no
      t.string :sold_to
      t.string :ship_to
      t.string :bill_to
      t.string :contract_no
      t.string :line_number

      t.timestamps
   end
  end

  def self.down
    drop_table :bpmachines 
  end
end
