class AddNamePhoneAddressToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_no, :string
  end
end
