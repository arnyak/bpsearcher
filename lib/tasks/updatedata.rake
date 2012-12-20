namespace :updatedata do
 desc "Update nbcontracts and nbmachines in bpcentrals table"
 task :updatebpcentrals => :environment do
    nbbpcentrals = Bpcentral.count
    offset = 0
    until (offset > nbbpcentrals -1)
      Bpcentral.all(:offset => offset, :limit => 1000).each do |bp|
       bp.nbcontracts = get_nbcontracts(bp.bpno)
       bp.nbmachines = get_nbmachines_with_ongoing_contracts(bp.bpno) + get_nbmachines_without_contracts(bp.bpno)
       bp.save
       p '> ' + bp.bpno.to_s + ' ' + bp.nbcontracts.to_s + ' ' + bp.nbmachines.to_s if bp.nbcontracts > 0
      end
     p '>' + offset.to_s
     offset += 1000
    end
 end

    def get_nbcontracts(bpno)
       Bpcontract.count(:conditions => ["current_date < contract_enddate and ? = ship_to", bpno])
    end

    def get_nbmachines_with_ongoing_contracts(bpno)
       Bpmachine.count(:joins => :bpcontracts, :conditions => ["current_date < contract_enddate and ? = bpcontracts.ship_to", bpno])
    end

    def get_nbmachines_without_contracts(bpno)
       Bpmachine.count(:conditions => [" ? = contract_no and  ? = ship_to", '', bpno])
    end
end
