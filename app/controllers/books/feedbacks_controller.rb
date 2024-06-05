class Books::FeedbacksController < FeedbacksController
    before_action :set_commentable
  
    private
  
    def set_commentable
      @commentable = Book.find(params[:book_id])
    end
  
  end