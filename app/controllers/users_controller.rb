class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params.fetch(:username))
  end
  
  def liked
    @user = User.find_by!(username: params.fetch(:username))
  end

  def discover
    @user = User.find_by!(username: params.fetch(:username))
  end

  def feed
    @user = current_user
  end
  
  def followers
     @user = current_user
  end

  def following
      @user = current_user
  end
end
