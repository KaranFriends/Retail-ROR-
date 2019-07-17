class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order
      t.string :product_id
      t.string :name
      t.string :description
      t.integer :price
      t.string :brand
      t.string :date_first_available
      t.string :quantity

      t.timestamps
    end
  end
end
