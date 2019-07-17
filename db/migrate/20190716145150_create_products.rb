class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :price
      t.references :user
      t.string :brand
      t.string :date_first_available
      t.timestamps
    end
  end
end
