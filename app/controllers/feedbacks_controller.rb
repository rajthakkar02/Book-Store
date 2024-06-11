class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def create
    @feedback = @commentable.feedbacks.new(feedback_params)
    @feedback.user = current_user
    @feedback.save

    redirect_to @commentable, notice: "Comment created..."
  end

  def feedback_params
    params.require(:feedback).permit(:comment)
  end

  def destroy
    @feedback = @commentable.feedbacks.find(params[:id])
    @feedback.destroy
    redirect_to @commentable, notice: "Feedback was successfully deleted."
  end
end
