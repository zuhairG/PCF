class AddActslistToEvent < ActiveRecord::Migration
  def change
    add_column :events, :actslist, :string
  end
end
