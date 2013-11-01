class Event < ActiveRecord::Base

  attr_accessible :date, :description, :end_time, :name, :start_time, :venue_id, :act_ids
  has_one :venue
  has_many :acts
  has_many :stard
  default_scope order('date, start_time ASC')

  validates_presence_of :date, :description, :start_time, :end_time, :start_time, :venue_id, :act_ids  
  validate :start_must_be_before_end_time

private 

  def venue_name(id)
    name = Venue.find(id)
    return name
  end
  
  def start_must_be_before_end_time
    errors.add(:start_time, "must be before end time") unless
       self.start_time < self.end_time
  end

end