class ChangeTypeOfColumnOfUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :alternate_number, :integer
  end
end
