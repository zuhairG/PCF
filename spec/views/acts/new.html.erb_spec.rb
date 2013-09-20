require 'spec_helper'

describe "acts/new" do
  before(:each) do
    assign(:act, stub_model(Act,
      :name => "MyString",
      :event_id => "MyString",
      :description => "MyString",
      :duration => "MyString"
    ).as_new_record)
  end

  it "renders new act form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", acts_path, "post" do
      assert_select "input#act_name[name=?]", "act[name]"
      assert_select "input#act_event_id[name=?]", "act[event_id]"
      assert_select "input#act_description[name=?]", "act[description]"
      assert_select "input#act_duration[name=?]", "act[duration]"
    end
  end
end
