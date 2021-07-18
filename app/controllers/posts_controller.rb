class PostsController < ApplicationController

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def index
    @post = Post.new
    @genres = Genre.all
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
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
    params.require(:post).permit(:image,:body,:genre_id)
  end

end
