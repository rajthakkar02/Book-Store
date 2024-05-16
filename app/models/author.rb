class Author < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Enter correct email id" }
  validates :phone_no, presence: true, uniqueness: true, length: { is: 10, message: "%{count} digit is the maximum allowed" }
  has_many :books
end
