class OrdersController < ApplicationController
  
  def new
    @addresses = Address.where(user_id: session[:current_user_id])
  end

  def create
    # debugger
    @order = Order.create(price: 0,status: "payment_pending", user_id: session[:current_user_id], address_id: params.require(:address_id))
    # @order.save
    @cart = Cart.find_by(user_id: session[:current_user_id])

    @cart_items = CartItem.where(cart_id: @cart.id,status: "new")
    @price = 0
    @cart_items.each do |cart_item|
      product = Product.find_by(id: cart_item.product_id)
      @OrderItem = OrderItem.create(order_id: @order.id, product_id: product.id, name: product.name,description: product.description, price:  product.price.to_i * cart_item.quantity.to_i , brand: product.brand, date_first_available: product.date_first_available,quantity: cart_item.quantity)
      cart_item.update(status: "old")
      @price += @OrderItem.price.to_i

    end

    @order.update(price: @price)

    redirect_to new_payment_path(order_id: @order.id)
  end

end
