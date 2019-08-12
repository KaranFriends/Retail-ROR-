class PaymentController < ApplicationController

  def new
    @order_id = parameter_order_id
    @price = Order.find_by(id: @order_id).price
    @payment = Payment.create(order_id: @order_id,status: "pending")
    @payment.save

  end

  def create
    @payment = Payment.find_by(id: parameter[:id])
    @payment.update(mode: parameter[:mode],status: parameter[:status])
    if @payment.save
      EmailMailer.buyer(@payment.id).deliver_now
      EmailMailer.seller(@payment.id).deliver_now
    end
    redirect_to dashboard_index_path
  end

  def update
    @payment = Payment.find_by(id: parameter[:payment_id])
    @payment.update(table_card_detail_id: parameter[:id],status: "amount Paid")
    if @payment.save
      EmailMailer.buyer(@payment.id).deliver_now
      EmailMailer.seller(@payment.id).deliver_now
    end
    redirect_to dashboard_index_path
  end


  private

  def parameter_order_id
    params.require(:order_id)
  end

  def parameter
    params.permit(:id,:payment_id)
  end

  def parameter_update
    params.permit(:id,:mode,:status,:payment_id)
  end

end
