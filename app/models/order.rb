class Order < ApplicationRecord
  belongs_to :user
  has_one :payment
  has_many :order_item
  belongs_to :address
end
