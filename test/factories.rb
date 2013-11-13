FactoryGirl.define do
  
  factory :act do
    name "Test Act 1"
    duration "2 hours"
    act_type "Improv"
    description "Really gr8 act"
    association :event 
  end
  
  factory :event do
    date Date.today
    description "really gr8 event"
    start_time Time.now
    end_time 4.hours.from_now
    association :venue 
  end
  
  factory :performer do
    bio "I am from Pittsburgh" 
    email "testguy1@gmail.com" 
    name "Test Guy 1" 
    twitter "@testguy1"
  end
  
   factory :performer_act do
    association :performer
    association :act
  end
 
  factory :stared do 
    association :user
    association :event
  end
   
  factory :user do
    name "Big Joe"
    email "bigjoe@gmail.com"
  end
  
  factory :venue do 
    city "Pittsburgh" 
    state "PA" 
    name "Stage AE" 
    street_address "5000 Forbes Avenue" 
    zip_code 15289
  end 
  
end