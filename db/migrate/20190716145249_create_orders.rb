class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :price
      t.string :status
      t.references :user

      t.timestamps
    end
  end
end
