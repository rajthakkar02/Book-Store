class FeedbacksController < InheritedResources::Base

  private

    def feedback_params
      params.require(:feedback).permit(:user_id, :author_id, :book_id, :feedback)
    end

end
