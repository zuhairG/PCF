require 'spec_helper'

describe "Stareds" do
  describe "GET /stareds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get stareds_path
      response.status.should be(200)
    end
  end
end
