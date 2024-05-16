class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name: Rails.application.credentials.dig(:login, :username),
    password: Rails.application.credentials.dig(:login, :password),
    :if => :admin_controller?,
  )

  def admin_controller?
    self.class < ActiveAdmin::BaseController
  end
end
