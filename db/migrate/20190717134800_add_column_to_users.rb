class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    add_column :users, :phone_number, :string
    add_column :users, :alternate_number, :string
  end
end
