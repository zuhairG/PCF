class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :venue_id
      t.time :start_time
      t.time :end_time
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
