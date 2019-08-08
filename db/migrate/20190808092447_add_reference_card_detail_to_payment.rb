class AddReferenceCardDetailToPayment < ActiveRecord::Migration[5.2]
  def change
        add_reference :payments, :table_card_detail, foreign_key: true
  end
end
