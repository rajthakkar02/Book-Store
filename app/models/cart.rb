class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items

  def total_value
    cart_items.joins(:book).sum("books.price * cart_items.quantity")
  end
end
