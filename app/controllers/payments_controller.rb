class PaymentsController < ApplicationController

  def new
    @order_id = params[:order_id]
    @price = Order.find(@order_id).price
    @payment = Payment.create(order_id: @order_id,status: "pending")
  end

  def create
    @payment = Payment.find_by(id: params[:id])
    @payment.update_attributes(mode: params[:mode],status: params[:status])
    @order = Order.find(@payment.order_id)
    @order.status = params[:status]
    @order.save

    if @payment.save

      EmailMailer.buyer(@payment.id).deliver_now
      @order_id = Payment.find(@payment.id).order_id
      @user_id = Order.find(@order_id.id).user_id

      @order_items = OrderItem.where(order_id: @order_id)

      @order_items.each do |item|
        @product = Product.find(item.product_id)
        seller = User.find(@product.user_id)
        EmailMailer.seller(@user_id,@product.id,@order.address_id,seller.email).deliver_now
      end

    end
    flash[:success] = "order placed successfully"
    redirect_to dashboard_path
  end

  def update
    @payment = Payment.find(params[:payment_id])
    @payment.update(table_card_detail_id: params[:id],status: "amount paid")
    @order = Order.find(@payment.order_id)
    @order.status = "amount paid"
    @order.save
    
    if @payment.save
      @order_id = Payment.find(@payment.id).order_id
      @user_id = Order.find(@order_id).user_id

      @order_items = OrderItem.where(order_id: @order_id)

      @order_items.each do |item|
        @product = Product.find(item.product_id)
        seller = User.find(@product.user_id)
        EmailMailer.seller(@user_id,@product.id,@order.address_id,seller.email).deliver_now
      end
      EmailMailer.buyer(@payment.id).deliver_now
    end
    flash[:success] = "order placed successfully"
    redirect_to dashboard_path
  end

end
