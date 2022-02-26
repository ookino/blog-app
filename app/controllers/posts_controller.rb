class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    new_post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { new_post: new_post } }
    end
  end

  def create
    create_post = current_user.posts.new(params.require(:data).permit(:title, :text))
    create_post.comments_counter = 0
    create_post.likes_counter = 0
    create_post.update_post_counter
    if create_post.save
      flash[:success] = 'Post successfully added!'
      redirect_to user_posts_path
    else
      flash[:error] = 'Error: Post could not be created'
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end
end
