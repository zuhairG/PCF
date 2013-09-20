class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :name
      t.string :event_id
      t.integer :performer_act_id
      t.string :description
      t.string :duration

      t.timestamps
    end
  end
end
