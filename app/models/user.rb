class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_no, presence: true, uniqueness: true, length: { is: 10, message: "Enter 10 digit mobile number" }, numericality: { only_integer: true, message: "Only digit is allowed" }
  validates :name, presence: true
  has_many :books, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :orders
  has_many :authors, dependent: :destroy
  has_many :sold_orders, class_name: "Order", foreign_key: "seller_id"

  def ordered?(book)
    orders.exists?(book_id: book.id)
  end

  def send_invitation_email
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    token = raw
    self.reset_password_token = hashed
    self.reset_password_sent_at = Time.now.utc
    self.save
    UserMailer.invitation(self, token).deliver_later
  end

  # after_create :assign_admin_if_seller_matches
  # after_create :assign_seller_id

  private

  # def assign_seller_id
  #   seller = Seller.find_by(email: self.email)
  #   user = User.find_by(email: self.email)
  #   if seller == user
  #     User.seller_id = seller.id_value
  #   end
  # end

  # def assign_seller_id
  #   seller = Seller.find_by(email: self.email)
  #   user = User.find_by(email: self.email)
  #   if user.seller? &&  seller == user
  #     # self.seller_id = Seller.pluck(:id_value).sample
  #     update_column(:seller_id, seller.id_value)
  #   end
  # end

  # def assign_admin_if_seller_matches
  #   # Adjust the fields used for matching as necessary (e.g., email, name)
  #   seller = Seller.find_by(email: self.email)
  #   seller_no = Seller.find_by(phone_no: self.phone_no)

  #   if seller && seller_no
  #     update_column(:seller, true) unless self.seller?
  #   end
  # end
end
