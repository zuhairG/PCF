class Venue < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code, :event_id
  belongs_to :event
  # deleted the event_id
  validates_presence_of :city, :state, :name, :street_address, :zip_code

end
