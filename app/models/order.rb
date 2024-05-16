class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum status: {
    Order_Placed: 0,
    Shipped: 1,
    Delivered: 2 
  }
end
