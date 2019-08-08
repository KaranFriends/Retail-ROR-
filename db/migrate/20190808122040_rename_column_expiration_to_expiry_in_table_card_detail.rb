class RenameColumnExpirationToExpiryInTableCardDetail < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :table_card_detail, index: true, foreign_key: true
  end
end
