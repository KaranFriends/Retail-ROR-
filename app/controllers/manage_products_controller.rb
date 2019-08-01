class ManageProductsController < ApplicationController

  def index
    @products = Product.where(user_id: session[:current_user_id])
  end

  def new
    @product = Product.new
  end

  def create
    Product.new(parameter_for).save
    redirect_to manage_products_path
  end

  def edit
    @product = Product.find_by(id: parameter.to_i)
  end

  def update
    @product = Product.find_by(id: parameter.to_i)
    @product.update(parameter_for)
  end

  def destroy
    @product = Product.find_by(id: parameter.to_i)
    @product.product_picture.purge
    # @word = "hi"
  end

  private

  def parameter
    params.require(:id)
  end

  def parameter_for
    params.require(:product).permit(:name,:description,:price,:brand,:date_first_available,:product_picture,:user_id)
  end
end
