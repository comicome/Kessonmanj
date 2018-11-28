class ChangeTypeListToBeJsonbInRestaurant < ActiveRecord::Migration[5.2]
  def up
    change_column :restaurants, :type_list, :jsonb
  end

  def down
    change_column :restaurants, :type_list, :json
  end
end
