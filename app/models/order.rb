class Order < ApplicationRecord
  belongs_to :user
  has_one :payment, :dependent => :destroy
  has_many :order_item, :dependent => :destroy
  belongs_to :address
end
