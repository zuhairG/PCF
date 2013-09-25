class Act < ActiveRecord::Base
  attr_accessible :description, :duration, :event_id, :name
  belongs_to :event
  has_many :performer_act
  has_many :performers, through: :performer_act
end
