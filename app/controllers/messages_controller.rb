class MessagesController < ApplicationController

  def create
    @message = current_user.messages.new(message_params)
    @message.save
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.user_detail
    #current_userが参加しているchat_room_idを配列で取得
    chat_rooms = current_user.participants.pluck(:chat_room_id)
    # 相手とやり取りしてるチャットルームを検索
    participant = Participant.find_by(user_id: @user.id, chat_room_id: chat_rooms)

    chat_room = nil
    if participant.nil?
    chat_room = ChatRoom.new
    chat_room.save
      Participant.create(user_id: @user.id, chat_room_id: chat_room.id)
      Participant.create(user_id: current_user.id, chat_room_id: chat_room.id)
    else
      # チャットルームの情報を変数に格納
      chat_room = participant.chat_room
    end
    #chat_roomに紐づくmessagesテーブルの全レコードを取得
    @messages = chat_room.messages
    #showページのform_withでチャットを送信する際に必要なメッセージが空のインスタンス
    @message = Message.new(chat_room_id: chat_room.id)
  end



  private

  def message_params
    params.require(:message).permit(:message, :chat_room_id)
  end

end
