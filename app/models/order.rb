class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :quantity_of_book_order, numericality: { greater_than_or_equal_to: 1 }, presence: true
  enum status: {
    Order_Placed: 0,
    Shipped: 1,
    Delivered: 2,
    Canceled: 3,
  }

  belongs_to :seller, class_name: "User", foreign_key: "seller_id"

  def revenue
    quantity_of_book_order * book.price
  end

  def self.bookings_by_week
    where(created_at: Time.current.beginning_of_week..Time.current.end_of_week)
      .group_by_day_of_week(:created_at, format: "%a")
      .count
  end

  def self.bookings_by_month
    where(created_at: Time.current.beginning_of_year..Time.current.end_of_week)
    .group_by_month_of_year(:created_at, format: "%b").count
  end

  def self.popular_book
    joins(:book).group("books.book_name").sum(:quantity_of_book_order)
  end

  after_create :decrease_book_stock
  after_destroy :increase_book_stock

  def increase_book_stock
    book.update_stock_after_destroy!(quantity_of_book_order)
  end

  private

  def decrease_book_stock
    book.update_stock!(quantity_of_book_order)
  end
end
