require 'spec_helper'

describe "stareds/show" do
  before(:each) do
    @stared = assign(:stared, stub_model(Stared,
      :user_id => 1,
      :event_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
