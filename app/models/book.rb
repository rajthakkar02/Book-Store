class Book < ApplicationRecord
  belongs_to :author
  belongs_to :seller
  has_one_attached :book_file
  validates :book_name, presence: true, uniqueness: true
  validates :price, presence: true , numericality: {greater_than_or_equal_to: 1}
  validates :quantity, presence: true , numericality: {greater_than_or_equal_to: 1}
  validates :book_file, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },size: { less_than: 5.megabytes,message: "should be less than 5MB" }
end 
