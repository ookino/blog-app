class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    create_comment = current_user.comments.new(
      text: comment_params,
      user_id: current_user.id,
      post_id: @post.id
    )
    create_comment.update_comment_counter
    if create_comment.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", success: 'Success!'
    else
      render :new, alert: 'Error: failed to save comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy!
    @post.save
    flash[:success] = 'You have deleted this post!'
    redirect_to user_posts_path(current_user.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
