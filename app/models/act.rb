class Act < ActiveRecord::Base
  attr_accessible :description, :duration, :event_id, :name, :performer_ids, :act_type
  belongs_to :event
  has_many :performer_acts
  has_many :performers, through: :performer_acts
  # deleted the validates_presence of performer_ids
  validates_presence_of :name, :duration, :description, :event_id, :act_type  

  
end
