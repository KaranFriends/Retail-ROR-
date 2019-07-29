class ProductController < ApplicationController
  def index
    @product = Product.all
    @count = @product.length
  end
end
