class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.user_detail
    @game = @user.games
    @game_platform = @game[0].game_relation_game_platforms
    @game_account = @user.game_account
  end

end
