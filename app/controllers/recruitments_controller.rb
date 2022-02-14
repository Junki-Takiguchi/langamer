class RecruitmentsController < ApplicationController

  before_action :set_recruitment, only: [:show, :edit, :update, :destroy]
  before_action :search_recruitment, only: [:index, :search]

  def index
    @recruitments = Recruitment.where.not(user_id: current_user.id).order(updated_at: :desc).page(params[:page])
    set_title_column # 追記
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
    @results = @d.result
  end

  private
  def recruitment_params
    params.require(:recruitment).permit(:title, :content)
  end

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end

  def search_recruitment
    @d = Recruitment.ransack(params[:q])
  end

  def set_title_column # 追記
    @title_date = Recruitment.select("title").distinct  # 重複なくnameカラムのデータを取り出す
  end

end
