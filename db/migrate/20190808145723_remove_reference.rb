class RemoveReference < ActiveRecord::Migration[5.2]
  def change
    remove_reference :table_card_details, :payment, index: true, foreign_key: true
  end
end
