class BpmachinesController < ApplicationController
  def show
   @bp = Bpcentralorg.find_by_bpno(params[:bpno])
    @bpmachines = Bpmachine.find_by_sql("SELECT bpmachines.* FROM bpmachines JOIN bpcontracts on bpmachines.contract_no = bpcontracts.contract_no WHERE current_date < contract_enddate and '" + params[:bpno] + "' = bpmachines.ship_to UNION SELECT bpmachines.* FROM bpmachines WHERE '' = contract_no and '" + params[:bpno] + "' = ship_to")
   respond_to do |format|
      format.html
      format.js
      format.xls
   end
  end
end
