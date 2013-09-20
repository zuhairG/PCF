require 'spec_helper'

describe "performer_acts/show" do
  before(:each) do
    @performer_act = assign(:performer_act, stub_model(PerformerAct,
      :act_id => 1,
      :performer_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
