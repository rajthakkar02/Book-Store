# app/mailers/super_admin_mailer.rb

class SuperAdminMailer < ApplicationMailer
  default from: "notifications@bookstore.com"

  def new_seller_registration(seller_details)
    @seller_details = seller_details
    mail(to: "superadmin@bookstore.com", subject: "New Seller Registration")
  end
end
