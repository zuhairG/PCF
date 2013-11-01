namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    
    [Act, Event, Performer, Venue, PerformerAct].each(&:delete_all)
        
    Performer.populate 5 do |per|
        per.name = ['Ryan', 'Matt', 'Zuhair', 'Sheila', 'Senna']
        per.bio = "bio bio bio"
        per.twitter = "@johnsmith"
        per.email = "john@fake.email"
      
     PerformerAct.populate 1 do |pact| 
     	pact.performer_id = per.id
    
    Venue.populate 1 do |venue|
      venue.name = ['Park House', 'Hambones', 'PNC Park', 'Steel City Improv Theater', 'Harris']
      venue.city = "Pittsburgh"
      venue.state = "PA"
      venue.street_address = "street1"
      venue.zip_code = 15213
      
      Event.populate 3 do |event|
        venue.event_id = event.id
        event.venue_id = venue.id
        event.date = [Date.today, Date.tomorrow, Date.yesterday]
        event.start_time = ['15:30', '12:30', '13:30']
        event.end_time = ['16:30', '17:30', '14:30']
        event.description = "this is the description of this event"
        event.name = ['Pirates Game', 'Kickoff Party', 'Improv Jam', 'Organized patronage of some place', 'Show1', 'Show2', 'Show3']

        Act.populate 1 do |act|
          act.event_id = event.id
          act.duration = "30 minutes"
          act.description = "This is the description of this act"
          act.name = ['act1','the amazing act', 'this is an act name']
          act.act_type = ['standup', 'improv', 'workshop']
          act.performer_act_id = ['1','2','3','5']
          pact.act_id = act.id
          event.act_id = Act.all
          	end
          end
        end
      end
    end
  end
end
