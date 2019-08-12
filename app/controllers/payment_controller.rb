class PaymentController < ApplicationController

  def new
    @order_id = params[:order_id]
    @price = Order.find_by(id: @order_id).price
    @payment = Payment.create(order_id: @order_id,status: "pending")
    @payment.save
  end

  def create
    @payment = Payment.find_by(id: params[:id])
    @payment.update(mode: params[:mode],status: params[:status])

    if @payment.save

      @order_id = Payment.find_by(id: @payment).order_id
      @user_id = Order.find_by(id: @order_id).user_id

      @order_item = OrderItem.where(order_id: @order_id)

      @order_item.each do |item|
        @product = Product.find_by(id: item.product_id)
        seller = User.find_by(id: @product.user_id)
        email = seller.email
        EmailMailer.seller(@user_id,@product,@address,email).deliver_now
      end
      EmailMailer.buyer(@payment.id).deliver_now

    end

    redirect_to dashboard_index_path
  end

  def update
    @payment = Payment.find_by(id: params[:payment_id])
    @payment.update(table_card_detail_id: params[:id],status: "amount Paid")
    if @payment.save
      EmailMailer.buyer(@payment.id).deliver_now
      EmailMailer.seller(@payment.id).deliver_now
    end
    redirect_to dashboard_index_path
  end

end
