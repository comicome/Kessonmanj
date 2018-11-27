class RestaurantAddImagePath < ActiveRecord::Migration[5.2]
  def up
    add_column :restaurants, :image_url, :string
  end

  def down
    remove_column :restaurants, :image_url
  end
end
