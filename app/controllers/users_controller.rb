class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    binding.pry
  end

  def show
    @user = User.find(params[:id])
    redirect_to recruitments_path, notice: "不正なアクセスです。" if FriendRelation.check_block_status(current_user, @user)
    @profile = @user.user_detail
    @learn_languages = @user.learn_languages
    @speak_languages = @user.speak_languages
    @games = @user.games
    @game_platforms = @games.map { |game|
      game.game_relation_game_platforms
    }.flatten!
    @game_account = @user.game_account
    @recruitments = Recruitment.where(user_id: params[:id])
  end
end
