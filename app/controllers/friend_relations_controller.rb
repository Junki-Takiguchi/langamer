class FriendRelationsController < ApplicationController
  before_action :authenticate_user!
  respond_to? :js # 存在するアクションのrespondを全てjsで返す場合はこのような記述でも可能。

  def index
    @friend_requests = current_user.reverse_of_relations.select{ | application |
      application.status == "申請中"
    }
    @order_requests = current_user.friend_relations.select{ | application |
      application.status == "申請をキャンセル"
    }
  end

  def create
    @user = User.find(params[:friend_relation][:to_target_id])
    current_user.send_friend_request!(@user)
  end

  def update
    @friend_relation = FriendRelation.find(params[:id])
    @friend_relation.update(status: params[:friend_relation][:status])
    @from_applicant = User.find(params[:friend_relation][:from_applicant_id])
    @to_target = User.find(params[:friend_relation][:to_target_id])
    if params[:friend_relation][:status] == "フレンド"
      create_participant_table
      @user = @from_applicant
      redirect_to chat_rooms_path
    else
      redirect_to recruitments_path
    end
  end

  def destroy
    FriendRelation.find(params[:id]).delete
    @user = User.find(params[:friend_relation][:to_target_id])
  end

  private

  def friend_relation_params
    params.require(:friend_relation).permit(:status, :to_target_id)
  end


  def create_participant_table
    unless Participant.already_created_records?(@from_applicant, @to_target)
      chat_room = ChatRoom.new
      chat_room.save
      Participant.create(user_id: @friend_relation.from_applicant_id, chat_room_id: chat_room.id)
      Participant.create(user_id: current_user.id, chat_room_id: chat_room.id)
    end
  end
end
