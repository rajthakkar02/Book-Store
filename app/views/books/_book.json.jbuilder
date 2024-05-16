json.extract! book, :id, :book_name, :price, :quantity, :author_id, :seller_id, :created_at, :updated_at
json.url book_url(book, format: :json)
