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
    @cart_item = CartItem.where(cart_id: @cart.id,status: "new")
    @products= Array.new
    @cart_item.each do |product|
        @products.push(Product.find_by(id: product.product_id))
    end
  end

  def destroy
    @cart = CartItem.find_by(cart_id: parameter_delete[:id],status: "new")
    @cart.update(status: "old")
    redirect_to cart_index_path
  end

  def quantity_update
    if parameter_quantity_update[:type] == "add"
      @cart = Cart.find_by(user_id: session[:current_user_id])
      @cart_item = CartItem.find_by(cart_id: @cart.id, status: "new", product_id: parameter_quantity_update[:product].to_i)
      @cart_item.update(quantity: (@cart_item.quantity.to_i + 1))
      
    elsif (parameter_quantity_update[:type] == "subtract")
      @cart = Cart.find_by(user_id: session[:current_user_id])
      @cart_item = CartItem.find_by(cart_id: @cart.id, status: "new", product_id: parameter_quantity_update[:product].to_i)
        if @cart_item.quantity.to_i > 1
          @cart_item.update(quantity: (@cart_item.quantity.to_i - 1))
        end
    end
  end

  private

  def parameter
    params.permit(:product_id, :id, :status, :quantity)
  end

  def parameter_delete
    params.permit(:id)
  end

  def parameter_quantity_update
    params.permit(:product,:type)
  end

end
