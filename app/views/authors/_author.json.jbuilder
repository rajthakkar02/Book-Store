json.extract! author, :id, :name, :email, :phone_no, :created_at, :updated_at
json.url author_url(author, format: :json)
