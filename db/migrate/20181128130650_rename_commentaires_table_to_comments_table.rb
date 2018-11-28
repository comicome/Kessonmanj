class RenameCommentairesTableToCommentsTable < ActiveRecord::Migration[5.2]
  def up
    rename_table :commentaires, :comments
  end

  def down
    rename_table :comments, :commentaires
  end
end
