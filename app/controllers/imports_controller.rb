class ImportsController < ApplicationController
  def import
    Rails.logger.level = 0
    data = params[:file].read
    parsed = JSON.parse(data)
    parsed.each do |key, value|
      if (key == "venue")
        value.each do |venue|
          @venue = Venue.new
          @venue.name = venue["name"]
          @venue.street_address = venue["street_address"]
          @venue.city = venue["city"]
          @venue.state = venue["state"]
          @venue.zip_code = venue["zip_code"]
          #@venue.neighborhood = venue["neighborhood"]
          #@venue.url = venue["url"]
          @venue.save!
        end
      end
      # temp code
      event_dates = [1.day.from_now.to_date, 2.days.from_now.to_date, 3.days.from_now.to_date]
      if (key == "event")
        if (Venue.all.length > 0)
          value.each do |event|
            get_date = event_dates[Random.rand(2)]
            event_start_time = Time.now - Random.rand(2)
            event_end_time = Time.now + Random.rand(2)
            @event = Event.new
            @event.name = event["name"]
            @event.venue_id = event["venue_id"]
            @event.date = get_date # must change
            @event.start_time = event_start_time # must change
            @event.end_time = event_end_time # must change
            @event.description = event["description"]
            @event.save!
          end
        end
      end
      
      if (key == "act")
        if (Event.all.length > 0 && Performer.all.length > 0)
          value.each do |act|
            @act = Act.new
            @act.name = act["name"]
            @act.event_id = act["event_id"]
            @act.description = act["description"]
            @act.duration = act["duration"]
            @act.act_type = act["act_type"]
            act["performers"].each do |performer|
              @performer_act = PerformerAct.new
              @performer_act.act_id = @act.id
              @performer_act.performer_id = Performer.find(params[:name]).id
              @performer_act.save!
            end
            @act.save!
          end
        end
      end
      
      if (key == "performer")
        value.each do |performer|
          @performer = Performer.new
          @performer.name = performer["name"]
          if (performer["twitter"])
            @performer.twitter = performer["twitter"]
          end
          @performer.email = performer["email"]
          @performer.bio = performer["bio"]
          @performer.save!
        end
      end
    end
    redirect_to imports_path, notice: "Json imported."
  end
end
