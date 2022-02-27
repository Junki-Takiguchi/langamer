# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :reset_gender, only: [:create, :update]

  # GET /resource/sign_up
  def new
    super
    @user = User.new
  end

  # POST /resource
  def create
    super
    if params[:back]
      render :new
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  private
    def reset_gender
      unless params[:locale] == "ja"
        if params[:user][:user_detail_attributes][:gender] == "Male"
          params[:user][:user_detail_attributes][:gender] = 0
        elsif params[:user][:user_detail_attributes][:gender] == "Female"
          params[:user][:user_detail_attributes][:gender] = 1
        else
          params[:user][:user_detail_attributes][:gender] = 2
        end
      end
    end


  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_path(@user.id)
  end

end
