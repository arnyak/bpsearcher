class BpcontractsController < ApplicationController
  def show
    @bp = Bpcentralorg.find_by_bpno(params[:bpno])
    @bpcontracts = Bpcontract.find(:all, :conditions => [" current_date < contract_enddate AND ? = ship_to ", params[:bpno]])
  end
end
