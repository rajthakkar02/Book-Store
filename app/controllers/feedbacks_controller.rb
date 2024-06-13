# app/controllers/feedbacks_controller.rb

class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feedback, only: [:edit, :update, :destroy]
  before_action :find_commentable, only: [:create, :edit, :update]

  def create
    @feedback = @commentable.feedbacks.build(feedback_params)
    @feedback.user = current_user

    if @feedback.save
      redirect_to @commentable, notice: 'Feedback was successfully created.'
    else
      redirect_to @commentable, alert: 'All fields are required.'
    end
  end

  def edit
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to @feedback.commentable, notice: 'Feedback was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    commentable = @feedback.commentable
    @feedback.destroy
    redirect_to commentable, notice: 'Feedback was successfully deleted.'
  end

  private

  def feedback_params
    params.require(:feedback).permit(:comment, :rating)
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @commentable = $1.classify.constantize.find(value)
      end
    end
  end
end
