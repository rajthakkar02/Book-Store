class Authors::FeedbacksController < FeedbacksController
    before_action :set_commentable
  
    private
  
    def set_commentable
      @commentable = User.find(params[:author_id])
    end
  
  end