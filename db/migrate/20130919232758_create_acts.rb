class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :name
      t.integer :event_id
      t.string :description
      t.string :url
      t.string :facebook
      t.string :twitter
      t.string :photo_url

      t.timestamps
    end
  end
end