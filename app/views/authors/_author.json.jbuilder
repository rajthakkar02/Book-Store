json.extract! author, :id, :name, :email, :seller_id, :created_at, :updated_at
json.url author_url(author, format: :json)
