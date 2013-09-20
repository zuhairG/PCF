require 'spec_helper'

describe "acts/index" do
  before(:each) do
    assign(:acts, [
      stub_model(Act,
        :name => "Name",
        :event_id => "Event",
        :description => "Description",
        :duration => "Duration"
      ),
      stub_model(Act,
        :name => "Name",
        :event_id => "Event",
        :description => "Description",
        :duration => "Duration"
      )
    ])
  end

  it "renders a list of acts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Event".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Duration".to_s, :count => 2
  end
end
