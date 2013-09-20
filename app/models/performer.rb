class Performer < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :performer_act_id, :twitter
  has_many :performer_acts
end
