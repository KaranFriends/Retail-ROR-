class CartController < ApplicationController
  def update
    if(CartItem.find_by(product_id: params[:product_id],status: params[:status],cart_id: params[:id]))
      @exists = true
    else
      cart = CartItem.new(product_id: params[:product_id],cart_id: params[:id],status: params[:status],quantity: params[:quantity])
      cart.save
      @exists = false
    end
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
    @cart = CartItem.find_by(cart_id: params[:id],status: "new")
    @cart.update(status: "old")
    redirect_to cart_index_path
  end

  def quantity_update
    @cart = Cart.find_by(user_id: session[:current_user_id])
    @cart_item = CartItem.find_by(cart_id: @cart.id, status: "new", product_id: params[:product].to_i)

    if params[:type] == "add"
      @cart_item.update(quantity: (@cart_item.quantity.to_i + 1))
    elsif params[:type] == "subtract"
      if @cart_item.quantity.to_i > 1
        @cart_item.update(quantity: (@cart_item.quantity.to_i - 1))
      end
    end
  end

end
