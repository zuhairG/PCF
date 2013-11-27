require 'test_helper'

class PerformerTest < ActiveSupport::TestCase
  
  should have_many(:performer_acts)
  should have_many(:acts).through(:performer_acts)
      
  should validate_presence_of(:bio)
  should validate_presence_of(:email)
  should validate_presence_of(:name)
  should validate_presence_of(:twitter)
  
  # Validating bio
  should allow_value("Jonathan").for(:bio)
  should allow_value("jonathan").for(:bio)
  should allow_value("asdf").for(:bio)
  should allow_value("123 test bio!!").for(:bio)
  should allow_value("#hashtag #unittesting #whatwhat").for(:bio)
  should_not allow_value("").for(:bio)
  
  # Validating email
  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)
  
  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("fred@fred.con").for(:email)
  
  # Validating name
  should allow_value("John and Amy improv").for(:name)
  should allow_value("john").for(:name)
  should allow_value("asdf").for(:name)
  should allow_value("123 test name!!").for(:name)
  should allow_value("#hashtag #unittesting #whatwhat").for(:name)
  should_not allow_value("").for(:name)
  
  # Validating twitter 
  should_not allow_value("John and Amy improv").for(:twitter)
  should_not allow_value("").for(:twitter)
  should_not allow_value("123 test twitter!!").for(:twitter)
  should allow_value("@John_123.").for(:twitter)
  
  

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
 end
end