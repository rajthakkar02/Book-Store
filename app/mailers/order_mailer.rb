class OrderMailer < ApplicationMailer
  def confirmation_email(user, cart_items, total_value)
    @user = user
    @cart_items = cart_items
    @total_value = total_value
    mail(to: @user.email, subject: "Order Confirmation")
  end
end
