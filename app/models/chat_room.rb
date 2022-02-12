class ChatRoom < ApplicationRecord
  has_many :participants
  has_many :messages

  def get_speaker(room, current_user)
    speaker_id = room.participants.where.not(user_id: current_user.id).pluck(:user_id)
    @speaker = UserDetail.find_by(user_id: speaker_id)
  end
end
