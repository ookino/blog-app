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

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
