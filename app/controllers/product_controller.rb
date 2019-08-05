class ProductController < ApplicationController
  def index
    @products = Product.all
    @cart = Cart.find_by(user_id: session[:current_user_id])
    # @count = @product.length
  end
end
