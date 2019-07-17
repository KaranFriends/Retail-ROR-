class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.string :status
      t.references :cart
      t.references :product

      t.timestamps
    end
  end
end
