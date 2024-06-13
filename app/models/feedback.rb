class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :comment, presence: true
  validates :rating , inclusion: {in: 1..10}
  # validates :user_id, uniqueness: { scope: :commentable_id, message: "can only give one feedback per book" }
end
