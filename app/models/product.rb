class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :brand, presence: true
  validates :date_first_available, presence: true

  belongs_to :user
  has_many :cart_item
  has_one_attached :product_picture
end
