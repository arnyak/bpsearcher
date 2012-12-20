class Bpcentral < ActiveRecord::Base
  set_primary_key :bpno
  has_many :bpcontracts
  has_many :bpmachines
  has_one :bpcentralorg, :foreign_key => "bpno"

  set_inheritance_column :ruby_type
  
  def bpcentral_type
   self[:type]
  end
  
  def bpcentral_type=(s)
   self[:type]=s
  end
end
