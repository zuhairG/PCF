require 'spec_helper'

describe "performers/show" do
  before(:each) do
    @performer = assign(:performer, stub_model(Performer,
      :name => "Name",
      :twitter => "Twitter",
      :email => "Email",
      :bio => "Bio",
      :performer_act_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Twitter/)
    rendered.should match(/Email/)
    rendered.should match(/Bio/)
    rendered.should match(/1/)
  end
end
