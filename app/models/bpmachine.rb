class Bpmachine < ActiveRecord::Base
  set_primary_key :serial_no
  has_many :bpcontracts, :foreign_key => "serial_no"
  belongs_to :bpcentral
end
