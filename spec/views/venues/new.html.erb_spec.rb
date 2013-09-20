require 'spec_helper'

describe "venues/new" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :name => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => 1
    ).as_new_record)
  end

  it "renders new venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", venues_path, "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
      assert_select "input#venue_street_address[name=?]", "venue[street_address]"
      assert_select "input#venue_city[name=?]", "venue[city]"
      assert_select "input#venue_state[name=?]", "venue[state]"
      assert_select "input#venue_zip_code[name=?]", "venue[zip_code]"
    end
  end
end
