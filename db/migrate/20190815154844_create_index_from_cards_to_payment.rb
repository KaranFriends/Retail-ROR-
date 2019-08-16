class CreateIndexFromCardsToPayment < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :table_card_detail_id, :integer
    add_reference :payments, :card, foreign_key: true
  end
end
