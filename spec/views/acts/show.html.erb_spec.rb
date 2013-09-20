require 'spec_helper'

describe "acts/show" do
  before(:each) do
    @act = assign(:act, stub_model(Act,
      :name => "Name",
      :event_id => "Event",
      :description => "Description",
      :duration => "Duration"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Event/)
    rendered.should match(/Description/)
    rendered.should match(/Duration/)
  end
end
