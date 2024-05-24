class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:author_id, :seller_id, :book_name, :image, :price, :quantity)
    end

end
