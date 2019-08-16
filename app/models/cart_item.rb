class CartItem < ApplicationRecord

  def add
    self.update_attribute(:quantity, quantity + 1)
  end

  def sub
    if quantity > 1
      self.update_attribute(:quantity, quantity - 1)
    end
  end

  scope :new_order, -> {where(status: "new")}

  belongs_to :cart
  belongs_to :product

end
