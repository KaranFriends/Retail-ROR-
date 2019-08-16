class CartController < ApplicationController
  def update
    if(CartItem.find_by(product_id: params[:product_id],status: params[:status],
      cart_id: params[:id]))
      @exists = true
    else
      cart = CartItem.create(product_id: params[:product_id],cart_id: params[:id],
        status: params[:status],quantity: params[:quantity])
        @exists = false
      end
    end

    def index
      @cart = Cart.find_by(user_id: @current_user)
      @cart_items = CartItem.where(cart_id: @cart.id).new_order
      @products= Array.new
      @cart_items.each do |product|
        @products << Product.find_by(id: product.product_id)
      end
    end

    def destroy
      cart = CartItem.new_order.find_by(cart_id: params[:id])
      cart.update_attribute(:status ,"old")
      redirect_to cart_index_path
    end

    def quantity_update
      @cart = Cart.find_by(user_id: @current_user)
      @cart_item = CartItem.new_order.find_by(cart_id: @cart.id, product_id: params[:product])
      if params[:type] == "add"
        @cart_item.add
      elsif params[:type] == "subtract"
        @cart_item.sub
      end
    end

  end
