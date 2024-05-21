class BookController < ApplicationController
  def create
    @book.image.attach(params[:book][:image])
  end

  private
  def book_params
    params.require(:book).permit(:content, :image)
  end
end
