json.extract! order, :id, :user_id, :book_id, :seller_id, :quantity_of_book_order, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
