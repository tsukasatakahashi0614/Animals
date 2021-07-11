class PostsController < ApplicationController
  
  def new
  end
  
  def index 
    @post = Post.new
    @posts = Post.all
  end
  
  def show
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image,:body)
  end
  
end
