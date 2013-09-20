class Venue < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code
  belongs_to :event
end
