class PerformerAct < ActiveRecord::Base
  attr_accessible :act_id, :performer_id
  belongs_to :act
  has_one :performer
end
