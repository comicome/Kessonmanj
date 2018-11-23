class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
