class CreateIndexForBpmachines < ActiveRecord::Migration
  def self.up
   add_index(:bpmachines, :sold_to)
   add_index(:bpmachines, :ship_to)
   add_index(:bpmachines, :bill_to)
   add_index(:bpmachines, :contract_no)
   add_index(:bpmachines, :serial_no)
  end

  def self.down
   remove_index(:bpmachines, :sold_to)
   remove_index(:bpmachines, :ship_to)
   remove_index(:bpmachines, :bill_to)
   remove_index(:bpmachines, :contract_no)
   remove_index(:bpmachines, :serial_no)
  end
end
