class FeedbackAuthorsController < InheritedResources::Base

  private

    def feedback_author_params
      params.require(:feedback_author).permit(:user_id, :author_id, :feedback)
    end

end
