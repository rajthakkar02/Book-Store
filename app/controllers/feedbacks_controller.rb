# app/controllers/feedbacks_controller.rb

class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feedback, only: [:edit, :update, :destroy]
  before_action :set_commentable

  def create
    @feedback = @commentable.feedbacks.build(feedback_params)
    @feedback.user = current_user

    if Feedback.exists?(user_id: current_user.id)
      flash[:alert] = "You have already given feedback for this book."
      redirect_to @commentable
    else
      if @feedback.save
        flash[:notice] = "Feedback submitted successfully."
        redirect_to @commentable, notice: "Feedback was successfully created."
      else
        flash[:alert] = "Error submitting feedback."
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to @commentable, notice: "Feedback was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @feedback = @commentable.feedbacks.find(params[:id])
    @feedback.destroy
    redirect_to @commentable, notice: "Feedback was successfully deleted."
  end

  private

  def feedback_params
    params.require(:feedback).permit(:comment, :rating)
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def set_commentable
    @commentable = find_commentable
  end

  def find_commentable
    if params[:book_id]
      Book.find(params[:book_id])
    else
      fail "Unsupported commentable"
    end
  end
end
