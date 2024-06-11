class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /orders or /orders.json
  def index
    if current_user.seller?
      @orders = Order.where(seller_id: current_user.id)
    else
      @orders = Order.where(user_id: current_user.id)
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @cart = current_cart
    if @cart.cart_items.empty?
      redirect_to root_path, notice: "Your Cart is empty"
    else
      orders = []
      total_value = @cart.cart_items.sum { |item| item.book.price * item.quantity }

      @cart.cart_items.each do |cart_item|
        order = Order.new(
          user: current_user,
          book: cart_item.book,
          seller: cart_item.book.user,
          quantity_of_book_order: cart_item.quantity,
          status: 0 # Assuming 0 means a new order
        )

        if order.save
          orders << order
        else
          # Handle the case where order creation might fail for an item
          flash[:alert] = "Order creation failed: #{order.errors.full_messages.join(', ')}"
          redirect_to cart_path(@cart) and return
        end
      end

      OrderMailer.confirmation_email(current_user, @cart.cart_items, total_value).deliver_now
      @cart.destroy # Clear the cart after the order is placed
      session[:cart_id] = nil
      redirect_to root_path, notice: "Order placed successfully."
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id, :book_id, :seller_id, :quantity_of_book_order, :status)
  end

  def current_cart
    Cart.find_or_create_by(id: session[:cart_id]).tap do |cart|
      session[:cart_id] = cart.id
    end
  end
end
