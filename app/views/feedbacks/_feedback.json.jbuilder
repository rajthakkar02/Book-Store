json.extract! feedback, :id, :user_id, :author_id, :book_id, :feedback, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
