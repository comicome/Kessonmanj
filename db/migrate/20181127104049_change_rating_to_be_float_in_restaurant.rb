class ChangeRatingToBeFloatInRestaurant < ActiveRecord::Migration[5.2]
  def up
    change_column :restaurants, :rating, :float
  end

  def down
    change_column :restaurants, :rating, :integer
  end
end
