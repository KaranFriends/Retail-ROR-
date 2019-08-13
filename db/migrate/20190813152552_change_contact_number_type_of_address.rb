class ChangeContactNumberTypeOfAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :contact_number, :integer
  end
end
