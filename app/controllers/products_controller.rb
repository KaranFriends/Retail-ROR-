class ProductsController < ApplicationController
  
  def index
    @products = Product.where.not(user_id: session[:current_user_id])
    @cart = Cart.find_by(user_id: session[:current_user_id])
  end

  def show
    @product = Product.find_by(id: params[:product_id])
    @cart = Cart.find_by(user_id: session[:current_user_id])
  end
end
