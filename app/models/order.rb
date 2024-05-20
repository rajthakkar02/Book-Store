class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum status: {
    Order_Placed: 0,
    Shipped: 1,
    Delivered: 2 
  }
  validates :quantity_of_book_order , numericality: {greater_than_or_equal_to: 0}
end
