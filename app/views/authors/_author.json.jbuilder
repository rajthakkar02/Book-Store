json.extract! author, :id, :seller_id, :name, :email, :created_at, :updated_at
json.url author_url(author, format: :json)
