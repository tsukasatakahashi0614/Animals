class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @genres = Genre.all
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @genres = Genre.all
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def favorites
    @genres = Genre.all
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
