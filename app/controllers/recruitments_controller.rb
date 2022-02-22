class RecruitmentsController < ApplicationController

  before_action :set_recruitment, only: %i[show edit update destroy]
  before_action :set_filter, only: %i[index search]


  def index
    @recruitments = Recruitment.where.not(user_id: current_user.id).order(updated_at: :desc).page(params[:page])
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
        redirect_to recruitments_path, notice: "募集文を投稿しました。"
      else
        render :new
      end
    end
  end

  def show
    @user = User.find(Recruitment.find(params[:id]).user_id)
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
    user_id = Recruitment.find(params[:id]).user_id
    redirect_to recruitments_path , notice: "不正なアクセスです。" unless current_user.id == user_id
  end

  def update
    if @recruitment.update(recruitment_params)
      redirect_to recruitment_path(params[:id]), notice: '投稿を編集しました。'
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
    @recruitments = @search.result.where.not(user_id: current_user.id).order(updated_at: :desc)
    if @selected_learn_language.present?
      @recruitments = @recruitments.select { |n|
        n.user.learn_languages.each do |learn_language|
          if learn_language.learn_language == @selected_learn_language
            break learn_language.learn_language_status == "公開" ||
            (learn_language.learn_language_status == "フレンドのみ公開" &&
              FriendRelation.check_friend_status(current_user, User.find(n.user_id))
            )
          end
        end
      }
    end
    if @selected_speak_language.present?
      @recruitments = @recruitments.select { |n|
        n.user.speak_languages.each do |speak_language|
          if speak_language.speak_language == @selected_speak_language
            break speak_language.speak_language_status == "公開" ||
            (speak_language.speak_language_status == "フレンドのみ公開" &&
              FriendRelation.check_friend_status(current_user, User.find(n.user_id))
            )
          end
        end
      }
    end
    @recruitments = Kaminari.paginate_array(@recruitments).page(params[:page]).per(10)
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
    if params[:q].present?
      @selected_learn_language = params[:q][:user_learn_languages_learn_language_eq]
      @selected_speak_language = params[:q][:user_speak_languages_speak_language_eq]
    end
    @game_platform_list = GamePlatform.select("name")
    @learn_language_list = LearnLanguage.select('learn_language').distinct
    @speak_language_list = SpeakLanguage.select('speak_language').distinct
  end

end
