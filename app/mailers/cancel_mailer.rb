class CancelMailer < ApplicationMailer
  def cancel_mailer(user,order)
    @order = order
    @user = user
    mail(to: @user.email, subject: "Order Canceled")
  end
end
