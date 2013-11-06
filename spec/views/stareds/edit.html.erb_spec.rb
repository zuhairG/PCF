require 'spec_helper'

describe "stareds/edit" do
  before(:each) do
    @stared = assign(:stared, stub_model(Stared,
      :user_id => 1,
      :event_id => 1
    ))
  end

  it "renders the edit stared form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stared_path(@stared), "post" do
      assert_select "input#stared_user_id[name=?]", "stared[user_id]"
      assert_select "input#stared_event_id[name=?]", "stared[event_id]"
    end
  end
end
