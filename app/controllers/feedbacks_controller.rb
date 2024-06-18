class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable
  before_action :set_feedback, only: [:edit, :update, :destroy]

  def create
    @feedback = @commentable.feedbacks.build(feedback_params)
    @feedback.user = current_user

    if @feedback.save
      flash[:notice] = "Feedback submitted successfully."
      redirect_to @commentable, notice: "Feedback was successfully created."
    else
      flash[:alert] = "Error submitting feedback."
      render :new
    end
  end

  def edit
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to @commentable, notice: "Feedback was successfully updated."
    else
      render :edit , status: 422
    end
  end

  def destroy
    @feedback.destroy
    redirect_to @commentable, notice: "Feedback was successfully deleted."
  end

  private

  def feedback_params
    params.require(:feedback).permit(:comment, :rating)
  end

  def set_feedback
    @feedback = @commentable.feedbacks.find(params[:id])
  end

  def set_commentable
    @commentable = find_commentable
  end

  def find_commentable
    if params[:book_id]
      Book.find(params[:book_id])
    elsif params[:author_id]
      Author.find(params[:author_id])
    else
      fail "Unsupported commentable"
    end
  end
end
