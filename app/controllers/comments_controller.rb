class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment.hotel, notice: 'Comment was successfully created.' 
    else
      redirect_to @comment.hotel, notice: "Comment don't created"
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :hotel_id, :rating, :comment_text)
    end
end
