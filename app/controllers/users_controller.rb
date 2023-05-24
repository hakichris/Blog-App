class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find_by_id(params[:id])
    @post = Post.find_by_id(params[:id])
  end
end
