class Book < ApplicationRecord
  belongs_to :author
  belongs_to :seller
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [200,400]
  end
  validates :book_name, presence: true, uniqueness: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size: { less_than: 5.megabytes, message: "should be less than 5MB" }
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  has_many :feedbacks, as: :commentable
end
