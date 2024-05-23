class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_no, presence: true, uniqueness: true, length: { is: 10, message: "%{count} digit is the maximum allowed" }
  validates :name, presence: true

  after_save :assign_admin_if_seller_matches

  private

  def assign_admin_if_seller_matches
    # Adjust the fields used for matching as necessary (e.g., email, name)
    seller = Seller.find_by(email: self.email)

    if seller
      update_column(:seller, true) unless self.seller?
    end
  end
end
