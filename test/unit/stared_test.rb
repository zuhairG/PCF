require 'test_helper'

class StaredTest < ActiveSupport::TestCase
  
  should belong_to(:user)
  should belong_to(:event)
  
  # Testing other methods with a context
    context "Creating three acts" do
      # create the objects I want with factories
      setup do 
        @venue1 = FactoryGirl.create(:venue, :city => "Pittsburgh", :state => "PA", :name => "Stage AE", 
        :street_address => "5000 Forbes Avenue", :zip_code => 15289)
        

        @event1 = FactoryGirl.create(:event, :date =>  Date.today, :description => "really gr8 event", 
        :start_time => Time.now, :end_time => 5.hours.from_now, :venue_id => @venue1.id)
        
        @act1 = FactoryGirl.create(:act, :name => "Test Act 1", :act_type => "Improv", :description => "Really gr8 act",
         :event_id => @event1.id)


        @performer1 = FactoryGirl.create(:performer, :bio => "I am from Pittsburgh", :email => "testguy1@gmail.com", :name => "Test Guy 1", 
        :twitter => "@testguy1")
        @performer2 = FactoryGirl.create(:performer, :bio => "I am from Cleveland", :email => "testguy2@gmail.com", :name => "Test Guy 2", 
        :twitter => "@testguy2")
        @performer3 = FactoryGirl.create(:performer, :bio => "I am from Philly", :email => "testguy3@gmail.com", :name => "Test Guy 3", 
        :twitter => "@testguy3")

        @performeract1 = FactoryGirl.create(:performer_act, :act_id => @act1.id, :performer_id => @performer1.id)
        @performeract2 = FactoryGirl.create(:performer_act, :act_id => @act1.id, :performer_id => @performer2.id)
        @performeract3 = FactoryGirl.create(:performer_act, :act_id => @act1.id, :performer_id => @performer3.id)


      end

      # and provide a teardown method as well 
      teardown do 
        @act1.destroy
        @event1.destroy
        @performeract1.destroy
        @performeract2.destroy
        @performeract3.destroy

        assert @performeract1.valid?
        assert @performeract2.valid?
        assert @performeract3.valid?

        @performer1.destroy
        @performer2.destroy
        @performer3.destroy
        @venue1.destroy    
      end 

      # now run the tests:
      should "show that all the factories are properly created" do 
        assert_equal "Pittsburgh", @venue1.city
        assert_equal "really gr8 event", @event1.description 
        assert_equal "Test Act 1", @act1.name
        assert @performeract1.valid?
        assert @performeract2.valid?
        assert @performeract3.valid?
        assert_equal "I am from Pittsburgh", @performer1.bio
        assert_equal "I am from Cleveland", @performer2.bio
        assert_equal "I am from Philly", @performer3.bio
        assert_equal "5000 Forbes Avenue", @venue1.street_address  
      end 
      
      should "show that the performer acts have their associated acts and performers" do 
        assert_equal @act1.id, @performeract1.act_id
        assert_equal @performer1.id, @performeract1.performer_id
        
        assert_equal @act1.id, @performeract2.act_id
        assert_equal @performer2.id, @performeract2.performer_id
        
        assert_equal @act1.id, @performeract3.act_id
        assert_equal @performer3.id, @performeract3.performer_id
        
        
      end 
    end
  end