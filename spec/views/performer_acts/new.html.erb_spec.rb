require 'spec_helper'

describe "performer_acts/new" do
  before(:each) do
    assign(:performer_act, stub_model(PerformerAct,
      :act_id => 1,
      :performer_id => 1
    ).as_new_record)
  end

  it "renders new performer_act form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", performer_acts_path, "post" do
      assert_select "input#performer_act_act_id[name=?]", "performer_act[act_id]"
      assert_select "input#performer_act_performer_id[name=?]", "performer_act[performer_id]"
    end
  end
end
