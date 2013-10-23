class AddActtypeToAct < ActiveRecord::Migration
  def change
    add_column :acts, :act_type, :string
  end
end
