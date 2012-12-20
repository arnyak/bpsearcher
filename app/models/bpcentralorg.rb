class Bpcentralorg < ActiveRecord::Base
   has_one :bpcentral, :foreign_key => "bpno"
end
