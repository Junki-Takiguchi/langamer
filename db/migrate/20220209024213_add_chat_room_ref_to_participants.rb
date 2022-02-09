class AddChatRoomRefToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_reference :participants, :chat_room, null: false, foreign_key: true
  end
end
