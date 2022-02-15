class RecruitmentsController < ApplicationController

  before_action :set_recruitment, only: %i[show edit update destroy]
  before_action :set_filter, only: %i[index search]


  def index
    @recruitments = Recruitment.where.not(user_id: current_user.id).order(updated_at: :desc).page(params[:page])
    set_filter_column # 追記
  end

  def new
    if params[:back]
      @recruitment = Recruitment.new(recruitment_params)
    else
      @recruitment = Recruitment.new
    end
  end

  def create
    @recruitment = current_user.recruitments.build(recruitment_params)
    if params[:back]
      render :new
    else
      if @recruitment.save
        redirect_to recruitments_path, notice: "新規募集を投稿しました。"
      else
        render :new
      end
    end
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
  end

  def edit
  end

  def update
    if @recruitment.update(recruitment_params)
      redirect_to recruitments_path, notice: '投稿を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @recruitment.destroy
    redirect_to recruitments_path, notice: '投稿を削除しました。'
  end

  def confirm
    @recruitment = Recruitment.new(recruitment_params)
    render :new if @recruitment.invalid
  end

  def search
    @recruitments = @search.result.where.not(user_id: current_user.id).order(updated_at: :desc).page(params[:page]).per(5)
  end

  private
  def recruitment_params
    params.require(:recruitment).permit(:title, :content)
  end

  def set_recruitment
    begin
      @recruitment = Recruitment.find(params[:id])
    rescue
      recruitments_search_path
    end
  end

  def set_filter # 追記
    @search = Recruitment.ransack(params[:q])
    @game_platform_list = GamePlatform.select("name")
    @learn_language_list = LearnLanguage.select('learn_language').distinct
    @speak_language_list = SpeakLanguage.select('speak_language').distinct
  end

end
