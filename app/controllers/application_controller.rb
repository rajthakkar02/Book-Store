class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name: Rails.application.credentials.dig(:login, :username),
    password: Rails.application.credentials.dig(:login, :password),
    :if => :admin_controller?,
  )

  def admin_controller?
    self.class < ActiveAdmin::BaseController
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_method
  rescue_from NoMethodError, with: :handle_no_method_error

  def handle_no_method_error(exception)
    flash[:alert] = "Oops! Something went wrong."
    redirect_to root_path
  end

  def not_found_method
    render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_no, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_no])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
