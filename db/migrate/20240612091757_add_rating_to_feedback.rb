class AddRatingToFeedback < ActiveRecord::Migration[7.1]
  def change
    add_column :feedbacks, :rating, :decimal
  end
end
