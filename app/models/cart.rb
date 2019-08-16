class Cart < ApplicationRecord

  belongs_to :user, optional: true
  has_many :cart_item, :dependent => :destroy

end
