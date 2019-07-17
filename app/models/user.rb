class User < ApplicationRecord
  has_one :cart
  has_many :order
  has_many :product
  has_many :feedback
end
