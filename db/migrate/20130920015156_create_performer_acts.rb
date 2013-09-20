class CreatePerformerActs < ActiveRecord::Migration
  def change
    create_table :performer_acts do |t|
      t.integer :act_id
      t.integer :performer_id

      t.timestamps
    end
  end
end
