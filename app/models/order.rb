class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :seller
  validates :quantity_of_book_order, numericality: { greater_than_or_equal_to: 1 } , presence: true
  enum status: {
    Order_Placed: 0,
    Shipped: 1,
    Delivered: 2,
  }

  def revenue
    quantity_of_book_order * book.price
  end

  def self.bookings_by_week
    group_by_week(:created_at, format: "%d %b %Y").count
  end

  def self.bookings_by_month
    group_by_month(:created_at, format: "%b %Y").count
  end

  def self.popular_book
    joins(:book).group('books.book_name').sum(:quantity_of_book_order)
  end

  after_create :decrease_book_stock
  after_destroy :increase_book_stock

  private

  def decrease_book_stock
    book.update_stock!(quantity_of_book_order)
  end

  def increase_book_stock
    book.update_stock_after_destroy!(quantity_of_book_order)
  end

end
