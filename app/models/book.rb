class Book < ApplicationRecord
  belongs_to :author
  belongs_to :seller
end
