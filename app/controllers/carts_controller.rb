class CartsController < ApplicationController
  # before_action :authenticate_user!
  def show
    @cart = current_cart
  end

  def add
    @cart = current_cart
    book = Book.find(params[:book_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(book: book)
    @cart_item.quantity ||= 0
    if book.quantity >= @cart_item.quantity
      @cart_item.quantity += 1
      redirect_back fallback_location: root_path, notice: "Book added to cart."
      @cart_item.save
    else
      redirect_back fallback_location: root_path, alert: "Unable to add book to cart."
    end
  end

  def destroy
    @cart.cart_item.destroy!
  end

  def increase
    @cart_item = CartItem.find(params[:cart_item_id])
    if @cart_item.book.quantity > @cart_item.quantity
      @cart_item.quantity += 1
      redirect_to cart_path, notice: "Increased quantity."
      @cart_item.save
    else
      redirect_to cart_path, alert: "Unable to increase quantity."
    end
  end

  def decrease
    @cart_item = CartItem.find(params[:cart_item_id])
    @cart_item.quantity -= 1
    if @cart_item.quantity <= 0
      @cart_item.destroy!
      redirect_to cart_path, notice: "Remove item from cart."
    else
      if @cart_item.save
        redirect_to cart_path, notice: "Decreased quantity."
      else
        redirect_to cart_path, alert: "Unable to decrease quantity."
      end
    end
  end

  private

  def current_cart
    Cart.find_or_create_by(id: session[:cart_id]).tap do |cart|
      session[:cart_id] = cart.id
    end
  end
end
