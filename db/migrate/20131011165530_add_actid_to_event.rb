class AddActidToEvent < ActiveRecord::Migration
  def change
    add_column :events, :act_id, :integer
  end
end
