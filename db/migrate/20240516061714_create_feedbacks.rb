class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :author, null: true, foreign_key: true
      t.references :book, null: true, foreign_key: true
      t.text :feedback

      t.timestamps
    end
  end
end
