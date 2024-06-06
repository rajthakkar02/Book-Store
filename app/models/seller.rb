class Seller < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Enter correct email id" }
  validates :phone_no, presence: true, uniqueness: true, length: { is: 10, message: "%{count} digit is the maximum allowed" } , numericality: { only_integer: true , message: "Only digit is allowed"}
  validates :address, presence: true
  has_many :books
  has_many :orders
  has_many :users ,dependent: :destroy
  has_many :authors , dependent: :destroy
  # before_validation :set_seller_id

  private

  
  private
  
  # def set_seller_id
  #   self.seller_id = self.user_id if self.user_id.present?
  # end

end
