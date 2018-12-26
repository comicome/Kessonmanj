class AddNickNameToUser < ActiveRecord::Migration[5.2]

  def up
    add_column :users, :nickName, :string
  end

  def down
    remove_column :users, :nickName
  end
end
