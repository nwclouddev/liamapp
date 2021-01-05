class Events::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_event_comment

  def create
    @comment = @commentable.comments.create comment_params
    @comment.user = current_user
    if @comment.save
      redirect_to edit_event_path(@commentable), notice: "Comment saved successfully"
    end
  end


  private

    def set_event_comment
      @event_comment = Comment.find_by(commentable_type: 'Event', commentable_id: :event_id)
    end  

    def set_commentable
      @commentable = Event.find(params[:event_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end