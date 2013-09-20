require 'spec_helper'

describe "performer_acts/index" do
  before(:each) do
    assign(:performer_acts, [
      stub_model(PerformerAct,
        :act_id => 1,
        :performer_id => 2
      ),
      stub_model(PerformerAct,
        :act_id => 1,
        :performer_id => 2
      )
    ])
  end

  it "renders a list of performer_acts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
