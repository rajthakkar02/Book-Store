# app/mailers/super_admin_mailer.rb

class SuperAdminMailer < ApplicationMailer
  default from: "notifications@example.com"

  def new_seller_registration(seller_details)
    @seller_details = seller_details
    mail(to: "superadmin@example.com", subject: "New Seller Registration")
  end
end
