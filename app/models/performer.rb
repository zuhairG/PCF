class Performer < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :performer_act_id, :twitter
  has_many :performer_acts
  has_many :acts, through: :performer_acts
  validates_presence_of :bio, :email, :name, :twitter
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i
  validates_format_of :twitter, :with => /^[-\w\._@]+$/i, :message => "Username should only contain letters, numbers, or .-_@"
end
