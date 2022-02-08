class FriendRelationsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js # 存在するアクションのrespondを全てjsで返す場合はこのような記述でも可能。

  def create
    @user = User.find(params[:friend_relation][:to_target_id])
    current_user.send_friend_request!(@user)
  end

  def update
    FriendRelation.find(params[:id]).update(status: params[:friend_relation][:status])
  end

  def destroy
    FriendRelation.find(params[:id]).delete
  end
end
