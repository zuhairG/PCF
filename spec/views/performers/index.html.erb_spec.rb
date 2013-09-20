require 'spec_helper'

describe "performers/index" do
  before(:each) do
    assign(:performers, [
      stub_model(Performer,
        :name => "Name",
        :twitter => "Twitter",
        :email => "Email",
        :bio => "Bio",
        :performer_act_id => 1
      ),
      stub_model(Performer,
        :name => "Name",
        :twitter => "Twitter",
        :email => "Email",
        :bio => "Bio",
        :performer_act_id => 1
      )
    ])
  end

  it "renders a list of performers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Bio".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
