class Act < ActiveRecord::Base
  attr_accessible :description, :event_id, :name, :act_type
  belongs_to :event

  has_many :performer_acts
  has_many :performers, through: :performer_acts
  
  # deleted the validates_presence of performer_ids
  validates_presence_of :name, :description, :event_id, :act_type


  validates_format_of :name, :with => /.+/, :message => "name cannot be blank"

  
end
