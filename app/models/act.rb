class Act < ActiveRecord::Base
  attr_accessible :description, :event_id, :name, :act_type
  belongs_to :event
  has_many :performer_act
  has_many :performers, through: :performer_act
  validates_presence_of :name, :description, :event_id, :act_type
  
end