class CreateBpcentralorgTable < ActiveRecord::Migration
  def self.up
    create_table :bpcentralorgs do |t|
      t.string :bpno
      t.string :name1
      t.string :name2
      t.string :name3
      t.string :name4
      t.date :liquidationdate
      t.string :loc_no_1
      t.string :loc_no_2
      t.string :chk_digit
      t.string :zmod_task

      t.timestamps
   end
  end

  def self.down
    drop_table :bpcentralorgs
  end
end
