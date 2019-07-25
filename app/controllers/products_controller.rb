class ProductsController < ApplicationController
  def index
    @product = Product.all
    @count = Product.count

  end
end
