class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @current_user.comments.new(params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_posts_path(@post.author_id)
    else
      render :new, alert: 'ERROR! something went wrong while creating the comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
