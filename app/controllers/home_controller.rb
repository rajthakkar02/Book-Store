class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    if current_user&.seller?
      @authors = Author.where(user_id: current_user.id).map do |author|
        {
          name: author.name,
          total_bookings_week: author.total_bookings_current_week,
          total_bookings_month: author.total_bookings_current_month,
          total_bookings_year: author.total_bookings_current_year,
        }
      end
      @bookings_by_week = Order.where(seller_id: current_user.id).bookings_by_week
      @bookings_by_month = Order.where(seller_id: current_user.id).bookings_by_month
      @popular_book = Order.where(seller_id: current_user.id).popular_book
      @popular_rating = Book.where(user_id: current_user.id).all.popular_rating
    else
      @books = Book.all
      @Author = Author.all
      @q = Book.ransack(params[:q])
      @books = @q.result(distinct: true)
      render
    end
  end
end
