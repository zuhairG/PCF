require 'test_helper'


class VenueTest < ActiveSupport::TestCase

  should have_many(:events)
    
  should validate_presence_of(:city)
  should validate_presence_of(:state)
  should validate_presence_of(:name)
  should validate_presence_of(:street_address)
  should validate_presence_of(:zip_code)
  
  
  
  context "Creating three acts" do
    # create the objects I want with factories
    setup do 

      @venue1 = FactoryGirl.create(:venue, :city => "Pittsburgh", :state => "PA", :name => "Stage AE", 
      :street_address => "5000 Forbes Avenue", :zip_code => 15289)


      # # t.string   "name"
      # t.string   "street_address"
      # t.string   "city"
      # t.string   "state"
      # t.integer  "zip_code"

      @event1 = FactoryGirl.create(:event, :date =>  1.day.from_now.to_date, :description => "really gr8 event", 
      :start_time => 1.day.from_now.to_date, :end_time => 1.day.from_now.to_date, :venue_id => @venue1.id)
        # 
  #   @act1 = FactoryGirl.create(:act, :name => "Test Act 1", :duration => "2 hours", :act_type => "Improv", :description => "Really gr8 act",
  #   :event_id => @event1.id)


  #   @performer1 = FactoryGirl.create(:performer, :bio => "I am from Pittsburgh", :email => "testguy1@gmail.com", :name => "Test Guy 1", 
  #   :twitter => "@testguy1")
  #   @performer2 = FactoryGirl.create(:performer, :bio => "I am from Cleveland", :email => "testguy2@gmail.com", :name => "Test Guy 2", 
  #   :twitter => "@testguy2")
  #   @performer3 = FactoryGirl.create(:performer, :bio => "I am from Philly", :email => "testguy3@gmail.com", :name => "Test Guy 3", 
  #   :twitter => "@testguy3")

  #   @performeract1 = FactoryGirl.create(:performer_act, :act_id => @act1.id, :permormer_id => @performer1.id)
  #   @performeract2 = FactoryGirl.create(:performer_act, :act_id => @act1.id, :permormer_id => @performer2.id)
  #   @performeract3 = FactoryGirl.create(:performer_act, :act_id => @act1.id, :permormer_id => @performer3.id)


    end

      # and provide a teardown method as well 
    teardown do 
      #@act1.destroy
      #@event1.destroy
      #@perfomer1.destroy
      #@performeract1.destroy
      #@venue1.destroy    
    end 

    # now run the tests:
    should "show that the act factories are properly created" do 
      assert_equal "Pittsburgh", @venue1.name
    end 
  end  
end
