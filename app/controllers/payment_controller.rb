class PaymentController < ApplicationController
  # def create
  #   @payment = Payment.new
  # end

  def new
    @order_id = parameter_order_id
    @price = Order.find_by(id: @order_id).price
    @payment = Payment.create(order_id: @order_id,status: "pending")
    @payment.save

  end

  def create

    @payment = Payment.find_by(id: parameter[:id])
    @payment.update(mode: parameter[:mode],status: parameter[:status])
    @payment.save
    redirect_to dashboard_index_path

  end

  def update
    @payment = Payment.find_by(id: parameter[:payment_id])
    @payment.update(table_card_detail_id: parameter[:id],status: "amount Paid")
    redirect_to dashboard_index_path
  end

  # def show
  # # @order_id = parameter[:id]
  # # debugger
  #   @payment_id = parameter[:id]
  #   @payment = Payment.find_by(id: @payment_id)
  #   @payment.update(mode: parameter[:mode],status: parameter[:status])
  #
  #   @cards = TableCardDetail.where(user_id: session[:current_user_id])
  # end

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
