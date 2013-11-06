class Act < ActiveRecord::Base
  attr_accessible :description, :duration, :event_id, :name, :act_type
  belongs_to :event
  has_many :performer_act
  has_many :performers, through: :performer_act
  validates_presence_of :name, :duration, :description, :event_id, :performer_ids, :act_type  

  
end
