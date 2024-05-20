class FeedbackAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :author
  validates :feedback, presence: true
end
