class ProductController < ApplicationController
  def index
    @products = Product.all
    # @count = @product.length
  end
end
