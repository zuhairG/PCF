class Act < ActiveRecord::Base
  attr_accessible :description, :duration, :event_id, :name
  belongs_to :event
  has_many :performer_acts
end
