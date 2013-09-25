class Venue < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code, :event_id
  belongs_to :event
end
