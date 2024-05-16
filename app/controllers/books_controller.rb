class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:book_name, :price, :quantity, :author_id, :seller_id)
    end

end
