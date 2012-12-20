class CreateIndexForContractenddate < ActiveRecord::Migration
  def self.up
   add_index(:bpcontracts, :contract_enddate)
  end

  def self.down
   remove_index(:bpcontracts, :contract_enddate)
  end
end
