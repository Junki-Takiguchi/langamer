class FriendRelationsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js # 存在するアクションのrespondを全てjsで返す場合はこのような記述でも可能。

  def create
    @user = User.find(params[:friend_relation][:to_target_id])
    current_user.send_friend_request!(@user)
  end

  def update
    @user = FriendRelation.find(params[:id]).to_target
    current_user.update_friend_status!(@user)
  end

  # destroyは使用しない予定
  def destroy
    @user = FriendRelation.find(params[:id]).to_target
    current_user.delete_friend!(@user)
  end
end
