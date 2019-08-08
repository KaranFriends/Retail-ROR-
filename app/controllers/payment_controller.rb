class PaymentController < ApplicationController
  # def create
  #   @payment = Payment.new
  # end

  def new
    @order_id = parameter_order_id
    @price = Order.find_by(id: @order_id).price
    @card = TableCardDetail.find_by(user_id: session[:current_user_id], card_holder_name: "cash_on_delivery_card")
    @payment = Payment.create(order_id: @order_id,status: "pending",table_card_detail_id: @card.id)
    @payment.save
  end

  def create
    @payment = Payment.find_by(id: parameter[:payment_id])
    @payment.update(mode: parameter[:mode],status: parameter[:status])
    @payment.save
    redirect_to dashboard_index_path
  end

  def show
    # @order_id = parameter[:id]
    @payment_id = parameter[:payment_id]
    @payment = Payment.find_by(id: @payment_id)
    @payment.update(mode: parameter[:mode],status: parameter[:status])

    @cards = table_card_details.where(user_id: session[:current_user_id])
  end

  private

  def parameter_order_id
    params.require(:order_id)
  end

  def parameter
    params.permit(:id,:mode,:status,:payment_id)
  end

end
