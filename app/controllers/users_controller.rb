class UsersController < ApplicationController
  def show
    user = User.find_by(user_name: params[:id])
    @user = user
    @user_name = user.user_name
  end
end
