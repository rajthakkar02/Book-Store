# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new_seller, :create_seller]

  def new_seller
    @user = User.new
  end

  def create_seller
    @user = User.new(user_params)
    @user.seller = false
    @user.password = SecureRandom.hex(10) # Generate a random password

    if @user.save
      redirect_to root_path, notice: "Seller registered successfully."
    else
      render :new_seller
    end

    #   if @user.save
    #     # Send password reset instructions
    #     @user.send_reset_password_instructions
    #     redirect_to root_path, notice: 'Seller registered successfully. An email has been sent to set the password.'
    #   else
    #     render :new_seller
    #   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone_no, :email)
  end
end
