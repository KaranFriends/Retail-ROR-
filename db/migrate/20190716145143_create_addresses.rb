class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :contact_number
      t.string :address
      t.string :landmark
      t.references :user

      t.timestamps
    end
  end
end
