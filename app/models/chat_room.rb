class ChatRoom < ApplicationRecord
  has_many :participants
  has_many :messages

  def last_time(room, current_user)
    last_message = room.messages.where.not(user_id: current_user.id).last
    if last_message.present?
      time = last_message.created_at
    else
      time = room.created_at
    end
  end

  def get_speaker(room, current_user)
    speaker_id = room.participants.where.not(user_id: current_user.id).pluck(:user_id)
    @speaker = UserDetail.find_by(user_id: speaker_id)
  end

  def self.get_newly_message(current_user, other_user)
    current_user_rooms = Participant.where(user_id: current_user.id).pluck(:chat_room_id)
    other_user_rooms = Participant.where(user_id: other_user.id).pluck(:chat_room_id)
    match_room = (current_user_rooms & other_user_rooms).first
    messages = Message.where(chat_room_id: match_room).order(created_at: "DESC")
    return false unless messages.present?
    new_message = messages.find_by(user_id: other_user.id, read: "未読")
    if new_message.present?
      return new_message.message
    else
      return false
    end
  end
end
