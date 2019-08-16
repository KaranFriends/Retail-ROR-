class ChangeTableNameOfCardsDetails < ActiveRecord::Migration[5.2]
  def change
    rename_table :table_card_details, :cards
  end
end
