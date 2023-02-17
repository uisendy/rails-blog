class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = @current_user.likes.new(post_id: @post.id, author_id: current_user.id)
    if @like.save
      redirect_to user_posts_path(id: @post.author_id)
    else
      redirect_to @post
    end
  end
end
