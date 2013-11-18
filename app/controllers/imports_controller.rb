class ImportsController < ApplicationController
  
  def import
    # if current_user
    #   if current_user.admin
    Rails.logger.level = 0
    data = params[:file].read
    parsed = JSON.parse(data)
    parsed.each do |key, value|
      if (key == "venues")
        Venue.delete_all
        value.each do |venue|
          @venue = Venue.new
          @venue.name = venue["name"]
          @venue.street_address = venue["street_address"]
          @venue.city = venue["city"]
          @venue.state = venue["state"]
          @venue.zip_code = venue["zip_code"]
          #@venue.neighborhood = venue["neighborhood"]
          @venue.url = venue["url"]
          @venue.save!
        end
      end
      
      if (key == "events")
        if (Venue.all.length > 0)
          Event.delete_all
          value.each do |event|
            @event = Event.new
            @event.name = event["name"]
            @event.venue_id = event["venue_id"]
            @event.date = event["start_time"].to_date
            @event.start_time = Time.parse(event["start_time"])
            @event.end_time = Time.parse(event["end_time"])
            @event.description = event["description"]
            @event.save!
          end
        end
      end
      
      if (key == "acts")
        if (Event.all.length > 0)
          Act.delete_all
          value.each do |act|
            @act = Act.new
            @act.name = act["name"]
            if (Event.find_by_name(act["event_name"]) != nil)
              @act.event_id = Event.find_by_name(act["event_name"]).id
            end
            if (act["url"] != nil)
              @act.url = act["url"]
            end
            if (act["twitter"] != nil)
              @act.twitter = act["twitter"]
            end
            if (act["facebook"] != nil)
              @act.facebook = act["facebook"]
            end
            
            @act.description = act["description"]
            @act.act_type = act["act_type"]
            # NO PERFORMERS
            # act["performers"].each do |performer|
            #   @performer_act = PerformerAct.new
            #   @performer_act.act_id = @act.id
            #   @performer_act.performer_id = Performer.find(params[:name]).id
            #   @performer_act.save!
            # end
            @act.save!
          end
        end
      end
      
      # NOT BEING USED AT THE MOMENT PER BRIAN'S REQUEST
      # if (key == "performer")
      #   value.each do |performer|
      #     @performer = Performer.new
      #     @performer.name = performer["name"]
      #     if (performer["twitter"])
      #       @performer.twitter = performer["twitter"]
      #     end
      #     @performer.email = performer["email"]
      #     @performer.bio = performer["bio"]
      #     @performer.save!
      #   end
      # end
    end
  #   redirect_to events_path, notice: "Json imported."
  # end
  # else 
    redirect_to events_path, notice: "Access Denied "
  end
end
