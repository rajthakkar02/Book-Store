class AddSellerToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :seller, :boolean
  end
end
