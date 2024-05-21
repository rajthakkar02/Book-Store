class DropFeedbackAuthors < ActiveRecord::Migration[7.1]
  def change
    drop_table :feedback_authors
    drop_table :feedback_books
  end
end
