require 'spec_helper'

describe ContractsController do

  #Delete these examples and add some real ones
  it "should use ContractsController" do
    controller.should be_an_instance_of(ContractsController)
  end


  describe "GET 'view_bp_contract'" do
    it "should be successful" do
      get 'view_bp_contract'
      response.should be_success
    end
  end
end
