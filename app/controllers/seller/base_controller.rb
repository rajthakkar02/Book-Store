class Seller::BaseController < ApplicationController
  before_action :restrict_non_seller

  protected

  def restrict_non_seller
    redirect_to root_path unless current_user.seller?
  end
end
