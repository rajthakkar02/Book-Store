class CancelMailer < ApplicationMailer
  def cancel_mailer(user, order)
    @order = order
    @user = user
    mail(to: @user.email, subject: "Order Canceled")
  end

  def cancel_mailer_to_seller(seller, order)
    @order = order
    @seller = seller
    mail(to: @seller.email, subject: "Order for your book has been canceled")
  end
end
