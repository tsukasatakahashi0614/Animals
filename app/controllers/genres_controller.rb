class GenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(params_genre)
    @genres = Genre.all
    if @genre.save
      redirect_to genres_path
    else
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(params_genre)
      redirect_to genres_path
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find_by(id: params[:id]).destroy
    redirect_to genres_path
  end

  private

  def params_genre
    params.require(:genre).permit(:genre_name)
  end
end
