require 'spec_helper'

describe "performers/edit" do
  before(:each) do
    @performer = assign(:performer, stub_model(Performer,
      :name => "MyString",
      :twitter => "MyString",
      :email => "MyString",
      :bio => "MyString",
      :performer_act_id => 1
    ))
  end

  it "renders the edit performer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", performer_path(@performer), "post" do
      assert_select "input#performer_name[name=?]", "performer[name]"
      assert_select "input#performer_twitter[name=?]", "performer[twitter]"
      assert_select "input#performer_email[name=?]", "performer[email]"
      assert_select "input#performer_bio[name=?]", "performer[bio]"
      assert_select "input#performer_performer_act_id[name=?]", "performer[performer_act_id]"
    end
  end
end
