class HomeController < ApplicationController
  def index

    if params[:home]
       codepostal = params[:home][:postalcode]
       raisonsociale = params[:home][:raisonsociale]
       sqlserialno = ""

       if params[:home][:serialno] != "" 
          serialno = params[:home][:serialno]
          sqlserialno = " AND (bpcentrals.bpno in (select ship_to from bpcontracts where upper(serial_no) like '" + serialno.upcase + "%')  OR  bpcentrals.bpno in (select ship_to from bpmachines where upper(serial_no) like '" + serialno.upcase + "%'))"
       end
       street = params[:home][:street]
       city = params[:home][:city]

    @bps = Bpcentral.all(:joins => :bpcentralorg, :conditions => "bpcentrals.bpno like '2%' AND postl_cod1 like '" + codepostal + "%' AND upper(street) like '%" + street.upcase + "%' AND upper(city) like '%" + city.upcase + "%' AND upper(bpcentralorgs.name1) like '%" + raisonsociale.upcase + "%' " +  sqlserialno , :order => "nbcontracts DESC", :limit => 100)
    else

     @bps = Bpcentral.all(:joins => :bpcentralorg, :conditions => "bpcentrals.bpno like '2%'", :order => "nbcontracts DESC", :limit => 200)

    end
  end
end
