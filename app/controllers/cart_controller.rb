class CartController < ApplicationController
  def update
    # render plain: parameter[:id]
    if(CartItem.find_by(product_id: parameter[:product_id],status: parameter[:status],cart_id: parameter[:id]))
      @exists = true
    else
      cart = CartItem.new(product_id: parameter[:product_id],cart_id: parameter[:id],status: parameter[:status],quantity: parameter[:quantity])
      cart.save
      @exists = false
    end
    # render plain: cart.inspect
    # cart.save
  end

  def index
    @cart = Cart.find_by(user_id: session[:current_user_id])
    @cart_item = CartItem.where(cart_id: @cart,status: "new")
  end

  def destroy
    @cart = CartItem.find_by(parameter_delete)
    @cart.update(status: "old")
  end

  private

  def parameter
    params.permit(:product_id, :id, :status, :quantity)
  end

  def parameter_delete
    params.permit(:id)
  end

end
