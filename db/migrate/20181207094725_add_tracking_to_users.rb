class AddTrackingToUsers < ActiveRecord::Migration[5.2]

  def up
      add_column :users, :sign_in_count, :integer
  end

  def down
    remove_column :users, :sign_in_count
  end
end