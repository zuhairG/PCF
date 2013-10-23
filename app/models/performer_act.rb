class PerformerAct < ActiveRecord::Base
  attr_accessible :act_id, :performer_id
  has_one :act
  has_one :performer
end
