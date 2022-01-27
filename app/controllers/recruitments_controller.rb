class RecruitmentsController < ApplicationController

  before_action :set_recruitment, only: [:show, :edit, :update, :destroy]


  def index
    @recruitments = Recruitment.all
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

  private
  def recruitment_params
    params.require(:recruitment).permit(:title, :content)
  end

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end
end
