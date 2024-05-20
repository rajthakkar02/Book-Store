class FeedbackBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :feedback, presence: true
end
