class RemoveIndexFromPayment < ActiveRecord::Migration[5.2]
  def change
    remove_index :payments, column: :table_card_detail_id
  end
end
