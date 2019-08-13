class ChangeColumnTypesOfProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :date_first_available, :date
    change_column :products, :price, :integer
  end
end
