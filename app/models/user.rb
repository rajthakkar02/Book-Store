class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_no, presence: true, uniqueness: true, length: { is: 10, message: "%{count} digit is the maximum allowed" } , numericality: { only_integer: true , message: "Only digit is allowed"}
  validates :name, presence: true
  has_many :books , dependent: :destroy
  # belongs_to :seller  
  after_create :assign_admin_if_seller_matches
  after_create :assign_seller_id
 

  private

  # def assign_seller_id
  #   seller = Seller.find_by(email: self.email)
  #   user = User.find_by(email: self.email)
  #   if seller == user
  #     User.seller_id = seller.id_value
  #   end
  # end

  def assign_seller_id
    seller = Seller.find_by(email: self.email)
    user = User.find_by(email: self.email)
    if User.seller &&  seller == user
      # self.seller_id = Seller.pluck(:id_value).sample
      seller = Seller.find_by(email: self.email)
      update_column(:seller_id, seller.id)
    end
  end

  def assign_admin_if_seller_matches
    # Adjust the fields used for matching as necessary (e.g., email, name)
    seller = Seller.find_by(email: self.email)
    seller_no = Seller.find_by(phone_no: self.phone_no)

    if seller && seller_no
      update_column(:seller, true) unless self.seller?
    end
  end
end
