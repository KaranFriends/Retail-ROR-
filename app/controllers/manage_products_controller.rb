class ManageProductsController < ApplicationController

  def index
    @products = Product.where(user_id: session[:current_user_id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(parameter_for)
    unless @product.save
      render :new
    else
      flash[:success] = "Successfully Added"
      redirect_to manage_products_path
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    unless @product.update(parameter_for)
      render :edit
    else
      flash[:success] = "Successfully Edited"
      redirect_to manage_products_path
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.product_picture.purge
  end

  private

  def parameter_for
    params.require(:product).permit(:name,:description,:price,:brand,:date_first_available,:product_picture,:user_id)
  end
end
