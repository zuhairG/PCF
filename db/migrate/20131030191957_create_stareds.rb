class CreateStareds < ActiveRecord::Migration
  def change
    create_table :stareds do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
