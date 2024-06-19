# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new_seller, :create_seller]

  def new_seller
  end

  def create_seller
    # @user = User.new(user_params)
    # @user.seller = false
    # @user.password = SecureRandom.hex(10) # Generate a random password

    # if @user.save
    #   SuperAdminMailer.new_seller_registration(@user).deliver_now
    #   redirect_to root_path, notice: "Seller registered successfully."
    # else
    #   redirect_to root_path, notice: "Seller already registered"
    # end

    #   if @user.save
    #     # Send password reset instructions
    #     @user.send_reset_password_instructions
    #     redirect_to root_path, notice: 'Seller registered successfully. An email has been sent to set the password.'
    #   else
    #     render :new_seller
    #   end

    @seller_details = params.permit(:name, :email, :phone_no)

    if @seller_details[:name].present? && @seller_details[:email].present? && valid_email?(@seller_details[:email]) && @seller_details[:phone_no].present? && valid_phone_no?(@seller_details[:phone_no])
      SuperAdminMailer.new_seller_registration(@seller_details).deliver_later
      flash[:notice] = "Thank you for submitting the form, We will contact you to verify details soon"
      redirect_to root_path
    else
      flash.now[:alert] = "All fields are required and in valid format"
      render "users/new_seller", status: :unprocessable_entity
    end
  end

  def valid_email?(email)
    email.match?(/\A[-a-z0-9_+.]+@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i)
  end

  def valid_phone_no?(phone_no)
    phone_no.match?(/\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/)
  end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :phone_no, :email)
  # end
end
