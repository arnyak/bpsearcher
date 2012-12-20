require 'spec_helper'

describe BpmachinesController do

  #Delete these examples and add some real ones
  it "should use BpmachinesController" do
    controller.should be_an_instance_of(BpmachinesController)
  end


  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end
end
