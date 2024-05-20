class Author < ApplicationRecord
  belongs_to :seller
  validates :name, presence: true
  validates :email, presence: true,uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Enter correct email id" }
  has_many :books
end
