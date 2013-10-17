namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    
    [Act, Event, Performer, Venue].each(&:delete_all)
        
    Performer.populate 1 do |per|
        per.name = "John"
        per.bio = "bio bio bio"
        per.twitter = "@johnsmith"
        per.email = "john@fake.email"
      end

    Venue.populate 5 do |venue|
      venue.name = ['Park House', 'Hambones', 'PNC Park', 'Steel City Improv Theater', 'Harris']
      venue.city = "Pittsburgh"
      venue.state = "PA"
      venue.street_address = "street1"
      venue.zip_code = 15213
      
      Event.populate 4 do |event|
        venue.event_id = event.id
        event.venue_id = venue.id
        event.date = [Date.today, Date.tomorrow, Date.yesterday]
        event.start_time = ['15:30', '12:30', '13:30']
        event.end_time = ['16:30', '17:30', '14:30']
        event.description = "this is the description of this event"
        event.name = ['Pirates Game', 'Kickoff Party', 'Improv Jam', 'Organized patronage of some place', 'show1', 'show2', 'show3']
        
        Act.populate 2 do |act|
          act.event_id = event.id
          act.duration = "30 minutes"
          act.description = "This is the description of this act"
          act.name = ['standup', 'improv', 'workshop']
          event.act_id = Act.all
        end
      end
    end
  end
end
