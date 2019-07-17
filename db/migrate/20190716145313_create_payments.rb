class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :mode
      t.string :status
      t.references :order

      t.timestamps
    end
  end
end
