class FriendRelationsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js # 存在するアクションのrespondを全てjsで返す場合はこのような記述でも可能。

  def create
    #paramsで送られているデータはfriend_relatiosnか？
    @user = User.find(params[:friend_relations][:to_target_id])
    current_user.send_friend_request!(@user)
  end

  def destroy
    @user = Friend_relation.find(params[:id]).to_target
    current_user.delete_friend!(@user)
  end
end
