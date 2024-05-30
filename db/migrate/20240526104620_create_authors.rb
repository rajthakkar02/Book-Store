class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.references :seller, null: false, foreign_key: true
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
