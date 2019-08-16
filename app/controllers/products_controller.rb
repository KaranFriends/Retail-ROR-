class ProductsController < ApplicationController

  def index
    @products = Product.where.not(user_id: @current_user)
    @cart = Cart.find_by(user_id: @current_user)
  end

  def show
    @product = Product.find(params[:product_id])
    @cart = Cart.find_by(user_id: @current_user)
  end
end
