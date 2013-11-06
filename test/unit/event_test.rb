require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should have_many(:acts)
  should have_one(:venue)
  
  #test basic validations 
  should validate_presence_of(:date
  should validate_presence_of(:venue_id)
  should validate_presence_of(:description)  
  should validate_presence_of(:start_time)
  should validate_presence_of(:end_time)
  

  # Testing other methods with a context
  context "Creating three acts" do
    # create the objects I want with factories
    setup do 
      @act1 = FactoryGirl.create(:act, :name => "Test Act 1", :act_type => "Improv", :duration => "2 hours", :description => "Really gr8 act", 
      :event_id => @event1.id)
      #@act2 = FactoryGirl.create(:act, :name => "Test Act 1", :act_type => "Improv", :duration => "2 hours")
      #@act3 = FactoryGirl.create(:act, :first_name => "Mark", :phone => "412-268-8211")
      
      @event1 = FactoryGirl.create(:event, :date => Date.parse('3rd Feb 2001'), :description => "really gr8 event", 
      :start_time => 1.day.from_now.to_date, :end_time => 2.days.from_now.to_date, :venue_id => @venue1.id)
      #@event2 = FactoryGirl.create(:event)
      #@event3 = FactoryGirl.create(:event)
      
      @performer1 = FactoryGirl.create(:performer, :bio => "I am from Pittsburgh", :email => "testguy1@gmail.com", :name => "Test Guy 1", 
      :twitter => "@testguy1")
      @performer2 = FactoryGirl.create(:performer, :bio => "I am from Cleveland", :email => "testguy2@gmail.com", :name => "Test Guy 2", 
      :twitter => "@testguy2")
      @performer3 = FactoryGirl.create(:performer, :bio => "I am from Philly", :email => "testguy3@gmail.com", :name => "Test Guy 3", 
      :twitter => "@testguy3")
      
      @performeract1 = FactoryGirl.create(:performer_act, :act_id => act1.id, :permormer_id => @performer1.id)
      @performeract2 = FactoryGirl.create(:performer_act, :act_id => act1.id, :permormer_id => @performer2.id)
      @performeract3 = FactoryGirl.create(:performer_act, :act_id => act1.id, :permormer_id => @performer3.id)
      
      @venue1 = FactoryGirl.create(:venue, :city => "Pittsburgh", :state => "Pennsylvania", :name => "Stage AE", 
      :street_address => "5000 Forbes Avenue", :zip_code => "15289", :event_id => @event1.id)
      #@venue2 = FactoryGirl.create(:venue)
      #@venue3 = FactoryGirl.create(:venue)
    end
    
    # and provide a teardown method as well 
    teardown do 
      @act1.destroy
      @event1.destroy
      @perfomer1.destroy
      @performeract1.destroy
      @venue1.destroy    
    end 
    
    # now run the tests:
    should "show that all factories are properly created" do 
      assert_equal "Test Act 1", @act1.name
    end 
  end
  
end