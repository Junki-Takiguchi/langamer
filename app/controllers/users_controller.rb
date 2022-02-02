class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.user_detail
    @game_account = @user.game_account
  end

end
