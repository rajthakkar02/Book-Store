class Book < ApplicationRecord
  has_one_attached :book_image
  belongs_to :author
  belongs_to :seller
  validates :book_name , presence:true , uniqueness: true
  validates :book_image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size: { less_than: 5.megabytes, message: "should be less than 5MB" }
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  has_many :feedbacks , as: :commentable

end
