class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip 
      t.string :phone
      t.string :cuisine
      t.string :image_url
      t.string :rating_url
      t.string :snippet
      
      t.timestamps null: false
    end
  end
end
