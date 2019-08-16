class EmailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.login_mailer.send.subject
  #
  def sign_up(email,user_name)
    @greeting = user_name
    mail(to: email, subject: "sign up confirm")
  end

  def seller(user_id,product_id,address,email)
    @user_id = user_id
    @product = product_id
    @address = address
    mail(to: email, subject: "Order Recieved")
  end

  def buyer(payment_id)
    @order_id = Payment.find_by(id: payment_id).order_id
    @user_id = Order.find_by(id: @order_id).user_id
    @buyer = User.find_by(id: @user_id)
    @address = Order.find_by(id: @order_id).address_id
    mail(to: @buyer.email, subject: "Order Recieved")
  end

end
