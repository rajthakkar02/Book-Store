class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :author , optional: true
  belongs_to :book , optional: true
end
