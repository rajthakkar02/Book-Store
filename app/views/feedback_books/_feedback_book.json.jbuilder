json.extract! feedback_book, :id, :user_id, :book_id, :feedback, :created_at, :updated_at
json.url feedback_book_url(feedback_book, format: :json)
