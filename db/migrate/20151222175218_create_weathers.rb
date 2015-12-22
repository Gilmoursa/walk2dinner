class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :temp_min
      t.integer :temp_max
      t.string :description
      t.string :icon
      t.integer :rain_chance
      t.time :sunset
      t.integer :wind_speed
      t.integer :humidity

      t.timestamps null: false
    end
  end
end
