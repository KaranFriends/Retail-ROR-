class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :email
      t.string :phone_number
      t.string :alternate_number

      t.timestamps
    end
  end
end
