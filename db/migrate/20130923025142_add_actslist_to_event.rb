class AddActslistToEvent < ActiveRecord::Migration
  def change
    add_column :events, :actslist, :array
  end
end
