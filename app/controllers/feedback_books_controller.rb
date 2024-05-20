class FeedbackBooksController < InheritedResources::Base

  private

    def feedback_book_params
      params.require(:feedback_book).permit(:user_id, :book_id, :feedback)
    end

end
