class AddPerformeridToAct < ActiveRecord::Migration
  def change
    add_column :acts, :performer_id, :integer
  end
end
