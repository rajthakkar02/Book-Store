class Cart < ApplicationRecord
    has_many :cart_items , dependent: :destroy
    has_many :books , through: :cart_items
end
