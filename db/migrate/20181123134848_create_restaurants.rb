class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :review_count
      t.integer :rating
      t.integer :price
      t.string :types_list
      t.string :address
      t.string :link
      t.string :source

      t.timestamps
    end
  end
end
