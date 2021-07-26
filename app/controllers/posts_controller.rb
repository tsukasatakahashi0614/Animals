class PostsController < ApplicationController
  before_action :authenticate_user!

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
    @genres = Genre.all
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = Post.find(params[:id])
  end

  def create
    @genres = Genre.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :body, :genre_id)
  end

end
