class AddNbcontractsmachinestobpcentrals < ActiveRecord::Migration
  def self.up
    add_column (:bpcentrals, :nbcontracts, :integer, :default =>0)
    add_column (:bpcentrals, :nbmachines, :integer, :default =>0)
  end

  def self.down
    remove_column (:bpcentrals, :nbcontracts)
    remove_column (:bpcentrals, :nbmachines)
  end
end
