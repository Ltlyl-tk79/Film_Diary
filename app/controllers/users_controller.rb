class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @movies = @user.movies
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def following
    @user = User.find_by(id: params[:id])
    @users = @user.followings
  end

  def followers
    @user  = User.find_by(id: params[:id])
    @users = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
