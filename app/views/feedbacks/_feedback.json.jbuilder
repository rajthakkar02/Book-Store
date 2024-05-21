json.extract! feedback, :id, :comment, :user_id, :commentable_id, :commentable_type, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
