class RenameColumnExpirationToExpiryInTableCardDetail < ActiveRecord::Migration[5.2]
  def change
    rename_column :table_card_details, :expiration, :expiry
  end
end
