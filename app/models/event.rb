class Event < ActiveRecord::Base
  attr_accessible :date, :description, :end_time, :name, :start_time, :venue_id
  has_one :venue
  has_many :acts
end
