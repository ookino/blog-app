class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    add_like = current_user.likes.new(
      user_id: current_user.id,
      post_id: @post.id
    )
    if add_like.save
      add_like.update_like_counter
      flash.now[:notice] = 'Post successfully added!'
      redirect_to user_posts_path(@post.id)
    else
      flash.now[:alert] = 'Error: failed to like post'
      redirect_to user_posts_path(current_user)
    end
  end
end
