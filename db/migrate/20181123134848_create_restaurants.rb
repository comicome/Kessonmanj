class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :review_count
      t.integer :rating
      t.string :price
      t.json :type_list, default: []
      t.string :address
      t.string :link
      t.string :source

      t.timestamps
    end
  end
end
