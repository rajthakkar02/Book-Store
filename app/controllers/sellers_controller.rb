class SellersController < InheritedResources::Base

  private

    def seller_params
      params.require(:seller).permit(:name, :email, :phone_no, :address)
    end

end
