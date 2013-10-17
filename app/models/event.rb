class Event < ActiveRecord::Base
  attr_accessible :date, :description, :end_time, :name, :start_time, :venue_id, :actslist
  has_one :venue
  has_many :acts
  default_scope order('date, start_time ASC')

  scope :today, where("date = ?", Date.current)
  scope :current, today.where("? BETWEEN start_time AND end_time",Time.now)
  scope :past, where("date < ?", Date.current)
  scope :for_date, lambda {|date| where("date = ?", date) }
  scope :for_venue, lambda {|venue| where("venue_id = ?", venue) }

private 

  def venue_name(id)
    name = Venue.find(id)
    return name
  end
end