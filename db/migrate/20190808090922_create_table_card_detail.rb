class CreateTableCardDetail < ActiveRecord::Migration[5.2]
  def change
    create_table :table_card_details do |t|

      t.integer :card_number
      t.string :expiration
      t.integer :cvv
      t.string :card_holder_name

      t.references :user

      t.timestamps
    end
  end
end
