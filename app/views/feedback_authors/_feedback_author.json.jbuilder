json.extract! feedback_author, :id, :user_id, :author_id, :feedback, :created_at, :updated_at
json.url feedback_author_url(feedback_author, format: :json)
