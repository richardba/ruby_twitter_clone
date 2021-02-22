class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    @user = User.find(current_user.id)
    
    @follows = User.all - @user.following - [@user]
    @followers = @user.followers
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to '/posts#index'
    else
      render 'new'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/', :notice => "Your post has been deleted"
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
