class CreateIndexForBpcentrals < ActiveRecord::Migration
   def self.up
    add_index(:bpcentrals, :postl_cod1)
    add_index(:bpcentrals, :street)
    add_index(:bpcentralorgs, :name1)
    add_index(:bpcontracts, :ship_to)
    add_index(:bpcontracts, :bill_to)
    
    
  end

  def self.down
    remove_index(:bpcentrals, :postl_cod1)
    remove_index(:bpcentrals, :street)
    remove_index(:bpcentralorgs, :name1)
    remove_index(:bpcontracts, :ship_to)
    remove_index(:bpcontracts, :bill_to)
  end
end
