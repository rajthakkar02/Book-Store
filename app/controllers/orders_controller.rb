class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:user_id, :book_id, :quantity_of_book_order, :status)
    end

end
