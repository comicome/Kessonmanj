class AddLongitudeLattitudeForRestaurants < ActiveRecord::Migration[5.2]
  def up
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longitude, :float
  end

  def down
    remove_column :restaurants, :latitude
    remove_column :restaurants, :longitude
  end
end
