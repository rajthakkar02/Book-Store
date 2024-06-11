class UserMailer < ApplicationMailer
  def invitation(user, token)
    @user = user
    @token = token
    mail(to: @user.email, subject: "Welcome to Seller Portal")
  end
end
