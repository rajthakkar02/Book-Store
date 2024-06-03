class Seller < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Enter correct email id" }
  validates :phone_no, presence: true, uniqueness: true, length: { is: 10, message: "%{count} digit is the maximum allowed" }
  validates :address, presence: true
  has_many :books
  has_many :orders
  has_many :users
  has_many :authors
end