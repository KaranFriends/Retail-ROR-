class ChangeColumnTypeOfCards < ActiveRecord::Migration[5.2]
  def change
    change_column :table_card_details, :expiry, :date
  end
end
