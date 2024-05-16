class CreateSellers < ActiveRecord::Migration[7.1]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :address

      t.timestamps
    end
  end
end
