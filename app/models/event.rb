class Event < ActiveRecord::Base

  attr_accessible :date, :description, :end_time, :start_time, :venue_id
  # ...and :name
  belongs_to :venue
  has_many :acts
  has_many :stareds
  default_scope order('date, start_time ASC')


  validates_presence_of :date, :description, :start_time, :end_time, :venue_id  

  before_create :start_must_be_before_end_time

#private 

def venue_name(id)
  venue = Venue.find(id)
  return venue.name
end
  
def start_must_be_before_end_time
  errors.add(:start_time, "must be before end time") unless
      (self.start_time < self.end_time)
end

end