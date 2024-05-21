class FeedbacksController < InheritedResources::Base

  private

    def feedback_params
      params.require(:feedback).permit(:comment, :user_id, :commentable_id, :commentable_type)
    end

end
