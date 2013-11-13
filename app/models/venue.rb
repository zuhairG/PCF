class Venue < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code, :venue_id
  has_many :events

  validates_presence_of :city, :state, :name, :street_address, :zip_code

end
