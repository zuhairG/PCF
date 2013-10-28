class Venue < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code, :event_id, :venue_id
  belongs_to :event
  
  validates_presence_of :city, :state, :name, :street_address, :zip_code, :event_id

end
