class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :quote
      t.string :rating
      t.references :product
      t.references :user

      t.timestamps
    end
  end
end
