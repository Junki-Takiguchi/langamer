# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:new, :create]

  # GET /resource/sign_up
  def new
    super
    @user = User.new
    #@games = @user.games.build
    #@game_relations = @games.game_relations.build
  end

  # POST /resource
  def create
    super
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


  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_path(@user.id)
  end

end
