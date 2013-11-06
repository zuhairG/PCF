class Performer < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :performer_act_id, :twitter, :act_ids
  has_many :performer_acts
  has_many :acts, through: :performer_acts
  validates_presence_of :bio, :email, :name, :twitter
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end
