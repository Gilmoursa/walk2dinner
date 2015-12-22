class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :weather_id
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
