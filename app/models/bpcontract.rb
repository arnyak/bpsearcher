class Bpcontract < ActiveRecord::Base
  set_primary_key :contract_no
  has_one :bpmachine , :foreign_key => "contract_no"
  belongs_to :bpcentral

end
