class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name: Rails.application.credentials.dig(:login, :username),
    password: Rails.application.credentials.dig(:login, :password),
    :if => :admin_controller?,
  )

  def admin_controller?
    self.class < ActiveAdmin::BaseController
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_no])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_no])
  end
end
