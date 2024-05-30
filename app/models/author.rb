class Author < ApplicationRecord
  belongs_to :seller
  has_many :orders
  has_many :books

  def total_revenue
    revenue = books.joins(:orders).sum("orders.quantity_of_book_order * books.price")
    # Rails.logger.debug "Total revenue for author #{self.name}: #{revenue}"
    revenue
  end

  def total_bookings_by_period(start_date, end_date)
    books.joins(:orders).where(orders: { created_at: start_date..end_date }).sum("orders.quantity_of_book_order")
  end

  def total_bookings_current_week
    start_date = Date.today.beginning_of_week
    end_date = Date.today.end_of_week
    total_bookings_by_period(start_date, end_date)
  end

  def total_bookings_current_month
    start_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month
    total_bookings_by_period(start_date, end_date)
  end

  def total_bookings_current_year
    start_date = Date.today.beginning_of_year
    end_date = Date.today.end_of_year
    total_bookings_by_period(start_date, end_date)
  end
end
