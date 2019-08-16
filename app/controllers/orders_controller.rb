class OrdersController < ApplicationController

  def new
    @addresses = Address.where(user_id: @current_user)
  end

  def create
    order = Order.create(price: 0,status: "payment_pending", user_id: @current_user, address_id: params.require(:address_id))
    cart = Cart.find_by(user_id: @current_user)

    cart_items = CartItem.where(cart_id: cart.id).new_order
    price = 0
    cart_items.each do |cart_item|
      product = Product.find_by(id: cart_item.product_id)
      order_item = OrderItem.create(order_id: order.id, product_id: product.id, name: product.name,description: product.description, price:  product.price.to_i * cart_item.quantity.to_i , brand: product.brand, date_first_available: product.date_first_available,quantity: cart_item.quantity)
      cart_item.update(status: "old")
      price += order_item.price.to_i
    end
    order.update_attribute(:price, price)
    redirect_to new_payment_path(order_id: order.id)
  end

end
