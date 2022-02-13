class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    binding.pry
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.user_detail
    @learn_languages = @user.learn_languages
    @speak_languages = @user.speak_languages
    @games = @user.games
    @game_platforms = @games.map { |game|
      game.game_relation_game_platforms
    }.flatten!
    @game_account = @user.game_account
  end
end
