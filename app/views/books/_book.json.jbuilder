json.extract! book, :id, :author_id, :seller_id, :book_name, :image, :price, :quantity, :created_at, :updated_at
json.url book_url(book, format: :json)
json.image url_for(book.image)
