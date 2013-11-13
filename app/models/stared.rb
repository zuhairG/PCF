class Stared < ActiveRecord::Base
  attr_accessible :event_id, :user_id
  belongs_to :user
  belongs_to :event

  validates_presence_of(:user_id)
  validates_presence_of(:event_id)
  
  
end
