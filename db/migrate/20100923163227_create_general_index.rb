class CreateGeneralIndex < ActiveRecord::Migration
  def self.up
    add_index(:bpcentralorgs, :bpno)
    add_index(:bpcentrals, :bpno)
    add_index(:bpcontracts, :sold_to)
  end

  def self.down
    remove_index(:bpcentralorgs, :bpno)
    remove_index(:bpcentrals, :bpno)
    remove_index(:bpcontracts, :sold_to)
  end
end
