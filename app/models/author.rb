class Author < ApplicationRecord
  belongs_to :user
  has_many :feedbacks, as: :commentable, dependent: :destroy
  has_many :books, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true

  def total_revenue
    revenue = books.joins(:orders).where.not(orders: {status: :Canceled}).sum("orders.quantity_of_book_order * books.price")
    revenue
  end

  def total_bookings_by_period(start_date, end_date)
    count_book = books.joins(:orders)
                      .where(orders: { created_at: start_date..end_date })
                      .where.not(orders: { status: :Canceled })
                      .sum("orders.quantity_of_book_order")
    count_book
  end

  def total_bookings_current_week
    start_date = DateTime.now.beginning_of_week
    end_date = DateTime.now.end_of_week
    Rails.logger.info "..................."
    Rails.logger.info total_bookings_by_period(start_date, end_date)
    total_bookings_by_period(start_date, end_date)
  end

  def total_bookings_current_month
    start_date = DateTime.now.beginning_of_month
    end_date = DateTime.now.end_of_month
    total_bookings_by_period(start_date, end_date)
  end

  def total_bookings_current_year
    start_date = DateTime.now.beginning_of_year
    end_date = DateTime.now.end_of_year
    total_bookings_by_period(start_date, end_date)
  end

  def average_rating
    feedbacks.average(:rating).to_f.round(1)
  end
end
