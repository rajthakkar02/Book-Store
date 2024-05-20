json.extract! book, :id, :book_name, :author_id, :seller_id, :price, :quantity, :created_at, :updated_at
json.url book_url(book, format: :json)
