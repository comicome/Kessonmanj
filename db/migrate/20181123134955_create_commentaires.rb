class CreateCommentaires < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaires do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
