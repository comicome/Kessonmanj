class RestaurantAddImagePath < ActiveRecord::Migration[5.2]
  def up
    add_column :restaurants, :image_url, :string
    add_column :restaurants, :type_list, :string
  end

  def down
    remove_column :restaurants, :image_url
    remove_column :restaurants, :types_list
  end
end
