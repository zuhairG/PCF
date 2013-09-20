require 'spec_helper'

describe "performers/new" do
  before(:each) do
    assign(:performer, stub_model(Performer,
      :name => "MyString",
      :twitter => "MyString",
      :email => "MyString",
      :bio => "MyString",
      :performer_act_id => 1
    ).as_new_record)
  end

  it "renders new performer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", performers_path, "post" do
      assert_select "input#performer_name[name=?]", "performer[name]"
      assert_select "input#performer_twitter[name=?]", "performer[twitter]"
      assert_select "input#performer_email[name=?]", "performer[email]"
      assert_select "input#performer_bio[name=?]", "performer[bio]"
      assert_select "input#performer_performer_act_id[name=?]", "performer[performer_act_id]"
    end
  end
end
