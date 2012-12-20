require 'spec_helper'

describe "/contracts/view_bp_contract" do
  before(:each) do
    render 'contracts/view_bp_contract'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/contracts/view_bp_contract])
  end
end
