class RemoveReferenceTableCardDetailFromPayment < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :table_card_details, :payment
  end
end
