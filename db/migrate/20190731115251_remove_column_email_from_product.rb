class RemoveColumnEmailFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :email, :string
  end
end
