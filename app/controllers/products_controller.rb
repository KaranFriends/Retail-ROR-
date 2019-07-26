class ProductsController < ApplicationController
  def index
    @product = Product.all
    @count = Product.count
  end

  def show
      render plain: "this is the product information"
  end
end
