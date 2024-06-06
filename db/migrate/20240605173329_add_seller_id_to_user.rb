class AddSellerIdToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :seller, null: true, foreign_key: true
  end
end
