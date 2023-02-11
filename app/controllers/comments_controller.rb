class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = params[:user_id]
    @comment.post_id = params[:post_id]
    @post = Post.find(params[:post_id])

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
