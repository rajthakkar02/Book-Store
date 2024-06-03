class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.seller?
      @authors = Author.all.map do |author|
        {
          name: author.name,
          total_bookings_week: author.total_bookings_current_week,
          total_bookings_month: author.total_bookings_current_month,
          total_bookings_year: author.total_bookings_current_year,
        }
        @bookings_by_week = Order.bookings_by_week
        @bookings_by_month = Order.bookings_by_month
      end
    else
      @books = Book.all
      @Author = Author.all
      @q = Book.ransack(params[:q])
      @books = @q.result(distinct: true)
      render
    end
  end
end