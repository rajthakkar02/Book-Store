class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  # before_action :set_seller, only: %i[ show edit update destroy ]
  # before_action :authenticate_user! # Assuming you have a method to authenticate users
  # before_action :authenticate_seller!, only: %i[edit update destroy]

  # GET /books or /books.json
  def index
    if current_user.seller?
      @books = Book.where(seller_id: current_user.id)
    else
      @books = Book.all
    end
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # def set_seller
  #   @seller = Seller.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:author_id, :seller_id, :image,:description, :book_name, :price, :quantity)
  end

  # def current_seller
  #   @current_seller ||= Seller.find(session[:seller_id]) if session[:seller_id]
  # end

  # def current_user
  #    @current_user = !current_user.seller # Assume you have a method to get the current customer
  # end

  # def authenticate_user!
  #   redirect_to new_session_path unless current_user
  # end

  # def authenticate_seller!
  #   redirect_to new_session_path unless current_seller
  # end
end
