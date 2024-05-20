class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:book_name, :author_id, :seller_id, :price, :quantity)
    end

end
